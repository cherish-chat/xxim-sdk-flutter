import 'dart:async';
import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/callback/subscribe_callback.dart';
import 'package:xxim_sdk_flutter/src/common/aes_params.dart';
import 'package:xxim_sdk_flutter/src/common/content_type.dart';
import 'package:xxim_sdk_flutter/src/common/conv_type.dart';
import 'package:xxim_sdk_flutter/src/common/send_status.dart';
import 'package:xxim_sdk_flutter/src/listener/conv_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/isar_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/msg_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/notice_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/pull_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/unread_listener.dart';
import 'package:xxim_sdk_flutter/src/model/conv_model.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';
import 'package:xxim_sdk_flutter/src/model/read_model.dart';
import 'package:xxim_sdk_flutter/src/model/record_model.dart';
import 'package:xxim_sdk_flutter/src/model/sdk_content.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';
import 'package:xxim_sdk_flutter/src/common/platform/platform_none.dart'
    if (dart.library.html) 'package:xxim_sdk_flutter/src/common/platform/platform_html.dart'
    if (dart.library.io) 'package:xxim_sdk_flutter/src/common/platform/platform_io.dart';

class SDKManager {
  final XXIMCore xximCore;
  final String directory;
  final Duration autoPullTime;
  final int pullMsgCount;
  final List<CollectionSchema> isarSchemas;
  final bool isarInspector;
  final SubscribeCallback subscribeCallback;
  final IsarListener? isarListener;
  final PullListener? pullListener;
  final ConvListener? convListener;
  final MsgListener? msgListener;
  final NoticeListener? noticeListener;
  final UnreadListener? unreadListener;

  SDKManager({
    required this.xximCore,
    required this.directory,
    required this.autoPullTime,
    required this.pullMsgCount,
    required this.isarSchemas,
    required this.isarInspector,
    required this.subscribeCallback,
    this.isarListener,
    this.pullListener,
    this.convListener,
    this.msgListener,
    this.noticeListener,
    this.unreadListener,
  });

  late String userId;
  late String isarName;
  late Isar isar;

  Timer? _timer;
  bool _pullStatus = false;

  /// 打开数据库
  Future openDatabase({
    required String userId,
    String? isarName,
  }) async {
    this.userId = userId;
    this.isarName = isarName ?? userId;
    Isar? isar = Isar.getInstance(this.isarName);
    if (isar != null) {
      this.isar = isar;
    } else {
      this.isar = await Isar.open(
        schemas: [
          RecordModelSchema,
          ConvModelSchema,
          MsgModelSchema,
          NoticeModelSchema,
          ReadModelSchema,
          ...isarSchemas,
        ],
        directory: directory,
        name: this.isarName,
        inspector: isarInspector,
      );
    }
    isarListener?.create(this.isar);
  }

  /// 关闭数据库
  Future closeDatabase() async {
    await Isar.getInstance(isarName)?.close();
  }

  /// 关闭所有数据库
  Future closeAllDatabase() async {
    Set<String> names = Isar.instanceNames;
    for (String name in names) {
      await Isar.getInstance(name)?.close();
    }
  }

  /// 记录表
  IsarCollection<RecordModel> recordModels() {
    return isar.recordModels;
  }

  /// 会话表
  IsarCollection<ConvModel> convModels() {
    return isar.convModels;
  }

  /// 消息表
  IsarCollection<MsgModel> msgModels() {
    return isar.msgModels;
  }

  /// 通知表
  IsarCollection<NoticeModel> noticeModels() {
    return isar.noticeModels;
  }

  /// 已读表
  IsarCollection<ReadModel> readModels() {
    return isar.readModels;
  }

  /// 启动定时器
  void _startTimer() {
    _cancelTimer();
    _timer = Timer(autoPullTime, () {
      openPullSubscribe();
    });
  }

  /// 取消定时器
  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// 打开拉取订阅
  void openPullSubscribe({
    Map<String, AesParams>? convParams,
  }) async {
    _pullStatus = true;
    _cancelTimer();
    pullListener?.start();
    convParams ??= await subscribeCallback.convParams();
    if (convParams.isEmpty) {
      pullListener?.end();
      if (_pullStatus) _startTimer();
      return;
    }
    BatchGetConvSeqResp? resp = await xximCore.batchGetConvSeq(
      reqId: SDKTool.getUUId(),
      req: BatchGetConvSeqReq(
        convIdList: convParams.keys.toList(),
      ),
    );
    if (resp == null || resp.convSeqMap.isEmpty) {
      pullListener?.end();
      if (_pullStatus) _startTimer();
      return;
    }
    List<BatchGetMsgListByConvIdReq_Item> items = [];
    await isar.writeTxn((isar) async {
      List<RecordModel> recordModelList = await _handleConvSeq(resp.convSeqMap);
      for (RecordModel recordModel in recordModelList) {
        int minSeq = recordModel.minSeq;
        int maxSeq = recordModel.maxSeq;
        if (recordModel.seq >= minSeq) {
          minSeq = recordModel.seq;
        }
        if (maxSeq - minSeq > pullMsgCount) {
          minSeq = maxSeq - pullMsgCount;
        }
        if (maxSeq <= minSeq) continue;
        items.add(BatchGetMsgListByConvIdReq_Item(
          convId: recordModel.convId,
          seqList: SDKTool.generateSeqList(minSeq, maxSeq),
        ));
      }
    });
    if (items.isNotEmpty) {
      await pullMsgDataList(items);
      convListener?.update();
      calculateUnreadCount();
    }
    pullListener?.end();
    if (_pullStatus) _startTimer();
  }

  Future<List<RecordModel>> _handleConvSeq(
    Map<String, BatchGetConvSeqResp_ConvSeq> convSeqMap,
  ) async {
    List<String> convIdList = convSeqMap.keys.toList();
    List<RecordModel> recordModelList = await recordModels()
        .filter()
        .repeat(
          convIdList,
          (q, element) => q.convIdEqualTo(element),
        )
        .findAll();
    bool updated = false;
    for (String convId in convIdList) {
      BatchGetConvSeqResp_ConvSeq convSeq = convSeqMap[convId]!;
      int index = recordModelList.indexWhere((item) {
        return item.convId == convId;
      });
      if (index != -1) {
        int minSeq = int.parse(convSeq.minSeq);
        int maxSeq = int.parse(convSeq.maxSeq);
        int updateTime = int.parse(convSeq.updateTime);
        RecordModel recordModel = recordModelList[index];
        if (recordModel.minSeq != minSeq) {
          recordModel.minSeq = minSeq;
          updated = true;
        }
        if (recordModel.maxSeq != maxSeq) {
          recordModel.maxSeq = maxSeq;
          updated = true;
        }
        if (recordModel.updateTime != updateTime) {
          recordModel.updateTime = updateTime;
          updated = true;
        }
      } else {
        recordModelList.add(RecordModel.fromProto(convSeq));
        updated = true;
      }
    }
    if (updated) await recordModels().putAll(recordModelList);
    return recordModelList;
  }

  /// 关闭拉取订阅
  void closePullSubscribe() {
    _pullStatus = false;
    _cancelTimer();
  }

  /// 拉取消息列表
  Future<List<MsgModel>?> pullMsgDataList(
    List<BatchGetMsgListByConvIdReq_Item> items,
  ) async {
    GetMsgListResp? resp = await xximCore.batchGetMsgListByConvId(
      reqId: SDKTool.getUUId(),
      req: BatchGetMsgListByConvIdReq(
        items: items,
      ),
    );
    if (resp == null) return null;
    List<MsgModel> msgModelList = [];
    await isar.writeTxn((isar) async {
      msgModelList = await _handleMsgList(resp.msgDataList);
    });
    return msgModelList;
  }

  /// 拉取消息
  Future<MsgModel?> pullMsgDataById({
    String? serverMsgId,
    String? clientMsgId,
  }) async {
    GetMsgByIdResp? resp = await xximCore.getMsgById(
      reqId: SDKTool.getUUId(),
      req: GetMsgByIdReq(
        serverMsgId: serverMsgId,
        clientMsgId: clientMsgId,
      ),
    );
    if (resp == null) return null;
    late MsgModel msgModel;
    await isar.writeTxn((isar) async {
      msgModel = (await _handleMsgList([resp.msgData])).first;
    });
    return msgModel;
  }

  /// 推送消息列表
  void onPushMsgDataList(
    List<MsgData> msgDataList,
  ) async {
    bool isFirstPull = await msgModels().count() == 0;
    List<MsgModel> msgModelList = [];
    await isar.writeTxn((isar) async {
      msgModelList = await _handleMsgList(msgDataList);
    });
    if (!isFirstPull && msgModelList.isNotEmpty) {
      msgListener?.receive(msgModelList);
    }
    convListener?.update();
    calculateUnreadCount();
  }

  /// 推送通知
  void onPushNoticeData(
    NoticeData noticeData,
  ) async {
    bool? status;
    if (noticeData.contentType == NoticeContentType.read) {
      if (noticeData.content.isEmpty) return;
      late ReadContent readContent;
      await isar.writeTxn((isar) async {
        readContent = await _handleReadMsg(
          SDKTool.utf8Decode(noticeData.content),
        );
      });
      status = await noticeListener?.readMsg(readContent);
    } else if (noticeData.contentType == NoticeContentType.edit) {
      if (noticeData.content.isEmpty) return;
      late MsgModel msgModel;
      await isar.writeTxn((isar) async {
        msgModel = await _handleEditMsg(
          MsgData.fromBuffer(noticeData.content),
        );
      });
      status = await noticeListener?.editMsg(msgModel);
    } else {
      late NoticeModel noticeModel;
      await isar.writeTxn((isar) async {
        noticeModel = await _handleNotice(noticeData);
      });
      status = await noticeListener?.receive(noticeModel);
    }
    if (status == true) {
      await xximCore.ackNoticeData(
        reqId: SDKTool.getUUId(),
        req: AckNoticeDataReq(
          convId: noticeData.convId,
          noticeId: noticeData.noticeId,
        ),
      );
    }
    convListener?.update();
    calculateUnreadCount();
  }

  /// 处理消息列表
  Future<List<MsgModel>> _handleMsgList(List<MsgData> msgDataList) async {
    Map<String, AesParams> convParams = await subscribeCallback.convParams();
    List<MsgModel> msgModelList = [];
    for (MsgData msgData in msgDataList) {
      MsgModel msgModel = MsgModel.fromProto(
        msgData,
        convParams[msgData.convId],
      );
      msgModel.sendStatus = SendStatus.success;
      msgModelList.add(msgModel);
    }
    await _updateRecordList(msgModelList);
    await _updateMsgList(msgModelList);
    await _updateMsgConvList(msgModelList);
    return msgModelList;
  }

  Future _updateRecordList(List<MsgModel> msgModelList) async {
    List<RecordModel> recordModelList = await recordModels()
        .filter()
        .repeat(
          msgModelList,
          (q, MsgModel element) => q.convIdEqualTo(element.convId),
        )
        .findAll();
    bool updated = false;
    for (MsgModel msgModel in msgModelList) {
      int index = recordModelList.indexWhere((item) {
        return item.convId == msgModel.convId;
      });
      if (index != -1) {
        RecordModel recordModel = recordModelList[index];
        if (msgModel.seq > recordModel.seq) {
          recordModel.seq = msgModel.seq;
          updated = true;
        }
      }
    }
    if (updated) await recordModels().putAll(recordModelList);
  }

  Future _updateMsgList(List<MsgModel> msgModelList) async {
    List<MsgModel> modelList = await msgModels()
        .filter()
        .repeat(
          msgModelList,
          (q, MsgModel element) => q.clientMsgIdEqualTo(element.clientMsgId),
        )
        .findAll();
    bool updated = false;
    for (MsgModel msgModel in msgModelList) {
      int index = modelList.indexWhere((item) {
        return item.clientMsgId == msgModel.clientMsgId;
      });
      if (index != -1) {
        MsgModel model = modelList[index];
        if (model.serverMsgId != msgModel.serverMsgId) {
          model.serverMsgId = msgModel.serverMsgId;
          updated = true;
        }
        if (model.serverTime != msgModel.serverTime) {
          model.serverTime = msgModel.serverTime;
          updated = true;
        }
        if (model.senderInfo != msgModel.senderInfo) {
          model.senderInfo = msgModel.senderInfo;
          updated = true;
        }
        if (model.contentType != msgModel.contentType) {
          model.contentType = msgModel.contentType;
          updated = true;
        }
        if (model.content != msgModel.content) {
          model.content = msgModel.content;
          updated = true;
        }
        if (model.seq != msgModel.seq) {
          model.seq = msgModel.seq;
          updated = true;
        }
        if (model.ext != msgModel.ext) {
          model.ext = msgModel.ext;
          updated = true;
        }
        if (model.sendStatus != SendStatus.success) {
          model.sendStatus = SendStatus.success;
          updated = true;
        }
      } else {
        modelList.add(msgModel);
        updated = true;
      }
    }
    if (updated) await msgModels().putAll(modelList);
  }

  Future _updateMsgConvList(List<MsgModel> msgModelList) async {
    List<ConvModel> convModelList = await convModels()
        .filter()
        .repeat(
          msgModelList,
          (q, MsgModel element) => q.convIdEqualTo(element.convId),
        )
        .findAll();
    bool updated = false;
    for (MsgModel msgModel in msgModelList) {
      int index = convModelList.indexWhere((item) {
        return item.convId == msgModel.convId;
      });
      ConvModel? convModel;
      if (index != -1) {
        convModel = convModelList[index];
      } else {
        convModel = ConvModel(
          convId: msgModel.convId,
          convType: ConvType.msg,
        );
        convModelList.add(convModel);
        updated = true;
      }
      MsgModel? model;
      if (convModel.clientMsgId != null) {
        model = await msgModels()
            .filter()
            .clientMsgIdEqualTo(convModel.clientMsgId!)
            .findFirst();
      }
      if (msgModel.options.updateConvMsg) {
        if (model != null) {
          if (msgModel.seq > model.seq) {
            convModel.clientMsgId = msgModel.clientMsgId;
            convModel.time = msgModel.serverTime;
            convModel.hidden = false;
            convModel.deleted = false;
            updated = true;
          }
        } else {
          convModel.clientMsgId = msgModel.clientMsgId;
          convModel.time = msgModel.serverTime;
          convModel.hidden = false;
          convModel.deleted = false;
          updated = true;
        }
      }
      if (msgModel.options.updateUnreadCount && msgModel.senderId != userId) {
        ReadModel? readModel = await readModels()
            .filter()
            .senderIdEqualTo(userId)
            .and()
            .convIdEqualTo(msgModel.convId)
            .findFirst();
        if (readModel != null) {
          if (msgModel.seq > readModel.seq) {
            convModel.unreadCount = ++convModel.unreadCount;
            updated = true;
          }
        } else {
          if (model != null) {
            if (msgModel.seq > model.seq) {
              convModel.unreadCount = ++convModel.unreadCount;
              updated = true;
            }
          } else {
            convModel.unreadCount = ++convModel.unreadCount;
            updated = true;
          }
        }
      }
    }
    if (updated) await convModels().putAll(convModelList);
  }

  /// 处理已读消息
  Future<ReadContent> _handleReadMsg(String content) async {
    ReadContent readContent = ReadContent.fromJson(content);
    ReadModel? readModel = await readModels()
        .filter()
        .senderIdEqualTo(readContent.senderId)
        .and()
        .convIdEqualTo(readContent.convId)
        .findFirst();
    if (readModel != null) {
      if (readContent.seq > readModel.seq) {
        readModel.seq = readContent.seq;
        await readModels().put(readModel);
      }
    } else {
      readModel = ReadModel(
        senderId: readContent.senderId,
        convId: readContent.convId,
        seq: readContent.seq,
      );
      await readModels().put(readModel);
    }
    if (readContent.senderId != userId) return readContent;
    MsgModel? msgModel = await msgModels()
        .filter()
        .convIdEqualTo(readContent.convId)
        .sortBySeqDesc()
        .findFirst();
    if (msgModel == null) return readContent;
    int unreadCount = msgModel.seq - readContent.seq;
    if (unreadCount < 0) return readContent;
    ConvModel? convModel = await convModels()
        .filter()
        .convIdEqualTo(
          msgModel.convId,
        )
        .findFirst();
    if (convModel == null) return readContent;
    if (convModel.unreadCount != unreadCount) {
      convModel.unreadCount = unreadCount;
      await convModels().put(convModel);
    }
    return readContent;
  }

  /// 处理编辑消息
  Future<MsgModel> _handleEditMsg(MsgData msgData) async {
    return (await _handleMsgList([msgData])).first;
  }

  /// 处理通知
  Future<NoticeModel> _handleNotice(NoticeData noticeData) async {
    NoticeModel noticeModel = NoticeModel.fromProto(noticeData);
    await _updateNotice(noticeModel);
    await _updateNoticeConv(noticeModel);
    return noticeModel;
  }

  Future _updateNotice(NoticeModel noticeModel) async {
    if (!noticeModel.options.storageForClient) return;
    NoticeModel? model = await noticeModels()
        .filter()
        .noticeIdEqualTo(noticeModel.noticeId)
        .findFirst();
    if (model != null) {
      if (model.noticeId != noticeModel.noticeId) {
        await noticeModels().put(noticeModel);
      }
    } else {
      await noticeModels().put(noticeModel);
    }
  }

  Future _updateNoticeConv(NoticeModel noticeModel) async {
    if (!noticeModel.options.updateConvNotice) return;
    ConvModel? convModel = await convModels()
        .filter()
        .convIdEqualTo(
          noticeModel.convId,
        )
        .findFirst();
    convModel ??= ConvModel(
      convId: noticeModel.convId,
      convType: ConvType.notice,
    );
    NoticeModel? model;
    if (convModel.noticeId != null) {
      model = await noticeModels()
          .filter()
          .noticeIdEqualTo(convModel.noticeId!)
          .findFirst();
    }
    if (model != null) {
      if (model.noticeId != noticeModel.noticeId) {
        convModel.noticeId = noticeModel.noticeId;
        convModel.time = noticeModel.createTime;
        convModel.hidden = false;
        convModel.deleted = false;
      }
    } else {
      convModel.noticeId = noticeModel.noticeId;
      convModel.time = noticeModel.createTime;
      convModel.hidden = false;
      convModel.deleted = false;
    }
    convModel.unreadCount = ++convModel.unreadCount;
    await convModels().put(convModel);
  }

  /// 计算未读数量
  void calculateUnreadCount() async {
    int count = await convModels().where().unreadCountProperty().sum();
    unreadListener?.unreadCount(count);
  }

  /// 创建消息
  Future<MsgModel> createMsg({
    String? clientMsgID,
    int? serverTime,
    String senderInfo = "",
    required String convId,
    required List<String> atUsers,
    required int contentType,
    required String content,
    required MsgOptionsModel options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int seq = 0;
    MsgModel? model = await msgModels()
        .filter()
        .convIdEqualTo(convId)
        .sortBySeqDesc()
        .findFirst();
    if (model != null) {
      seq = ++model.seq;
    }
    MsgModel msgModel = MsgModel(
      clientMsgId: clientMsgID ?? SDKTool.getUUId(),
      clientTime: serverTime ?? timestamp,
      serverTime: serverTime ?? timestamp,
      senderId: userId,
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: contentType,
      content: content,
      seq: seq,
      options: options,
      offlinePush: offlinePush,
      ext: ext,
    );
    await upsertMsg(msgModel: msgModel);
    return msgModel;
  }

  /// 发送消息列表
  Future<bool> sendMsgList({
    String? senderInfo,
    required List<MsgModel> msgModelList,
    required int deliverAfter,
  }) async {
    if (senderInfo != null) {
      List<MsgModel> modelList = [];
      for (MsgModel msgModel in msgModelList) {
        msgModel.senderInfo = senderInfo;
        modelList.add(msgModel);
      }
      await upsertMsgList(msgModelList: modelList);
    }
    Map<String, AesParams> convParams = await subscribeCallback.convParams();
    SendMsgListResp? resp = await xximCore.sendMsgList(
      reqId: SDKTool.getUUId(),
      req: SendMsgListReq(
        msgDataList: msgModelList.map((msgModel) {
          AesParams? aesParams = convParams[msgModel.convId];
          return MsgData(
            clientMsgId: msgModel.clientMsgId,
            clientTime: msgModel.clientTime.toString(),
            serverTime: msgModel.serverTime.toString(),
            senderId: msgModel.senderId,
            senderInfo: SDKTool.utf8Encode(msgModel.senderInfo),
            convId: msgModel.convId,
            atUsers: msgModel.atUsers,
            contentType: msgModel.contentType,
            content: msgModel.options.needDecrypt && aesParams != null
                ? SDKTool.aesEncode(
                    key: aesParams.key,
                    iv: aesParams.iv,
                    value: msgModel.content,
                  )
                : SDKTool.utf8Encode(msgModel.content),
            seq: msgModel.seq.toString(),
            options: MsgData_Options(
              storageForServer: msgModel.options.storageForServer,
              storageForClient: msgModel.options.storageForClient,
              needDecrypt: msgModel.options.needDecrypt,
              offlinePush: msgModel.options.offlinePush,
              updateConvMsg: msgModel.options.updateConvMsg,
              updateUnreadCount: msgModel.options.updateUnreadCount,
            ),
            offlinePush: MsgData_OfflinePush(
              title: msgModel.offlinePush.title,
              content: msgModel.offlinePush.content,
              payload: msgModel.offlinePush.payload,
            ),
            ext: SDKTool.utf8Encode(msgModel.ext),
          );
        }).toList(),
        deliverAfter: deliverAfter,
      ),
    );
    await isar.writeTxn((isar) async {
      int sendStatus = resp != null ? SendStatus.success : SendStatus.failed;
      List<MsgModel> modelList = await msgModels()
          .filter()
          .repeat(
            msgModelList,
            (q, MsgModel element) => q.clientMsgIdEqualTo(element.clientMsgId),
          )
          .findAll();
      for (MsgModel msgModel in msgModelList) {
        int index = modelList.indexWhere((item) {
          return item.clientMsgId == msgModel.clientMsgId;
        });
        if (index != -1) {
          modelList[index].sendStatus = sendStatus;
        }
        msgModel.sendStatus = sendStatus;
      }
      if (modelList.isNotEmpty) await msgModels().putAll(modelList);
      await _updateMsgConvList(msgModelList);
    });
    return resp != null;
  }

  /// 发送已读消息
  Future<bool> sendReadMsg(ReadContent content) async {
    content.senderId = userId;
    ReadMsgResp? resp = await xximCore.sendReadMsg(
      reqId: SDKTool.getUUId(),
      req: ReadMsgReq(
        senderId: content.senderId,
        convId: content.convId,
        seq: content.seq.toString(),
        noticeContent: SDKTool.utf8Encode(content.toJson()),
      ),
    );
    return resp != null;
  }

  /// 发送编辑消息
  Future<MsgModel?> sendEditMsg(MsgModel msgModel) async {
    Map<String, AesParams> convParams = await subscribeCallback.convParams();
    AesParams? aesParams = convParams[msgModel.convId];
    MsgData msgData = MsgData(
      clientMsgId: msgModel.clientMsgId,
      serverMsgId: msgModel.serverMsgId,
      clientTime: msgModel.clientTime.toString(),
      serverTime: msgModel.serverTime.toString(),
      senderId: msgModel.senderId,
      senderInfo: SDKTool.utf8Encode(msgModel.senderInfo),
      convId: msgModel.convId,
      atUsers: msgModel.atUsers,
      contentType: msgModel.contentType,
      content: msgModel.options.needDecrypt && aesParams != null
          ? SDKTool.aesEncode(
              key: aesParams.key,
              iv: aesParams.iv,
              value: msgModel.content,
            )
          : SDKTool.utf8Encode(msgModel.content),
      seq: msgModel.seq.toString(),
      options: MsgData_Options(
        storageForServer: msgModel.options.storageForServer,
        storageForClient: msgModel.options.storageForClient,
        needDecrypt: msgModel.options.needDecrypt,
        offlinePush: msgModel.options.offlinePush,
        updateConvMsg: msgModel.options.updateConvMsg,
        updateUnreadCount: msgModel.options.updateUnreadCount,
      ),
      offlinePush: MsgData_OfflinePush(
        title: msgModel.offlinePush.title,
        content: msgModel.offlinePush.content,
        payload: msgModel.offlinePush.payload,
      ),
      ext: SDKTool.utf8Encode(msgModel.ext),
    );
    EditMsgResp? resp = await xximCore.sendEditMsg(
      reqId: SDKTool.getUUId(),
      req: EditMsgReq(
        senderId: msgData.senderId,
        serverMsgId: msgData.serverMsgId,
        contentType: msgData.contentType,
        content: msgData.content,
        ext: msgData.ext,
        noticeContent: msgData.writeToBuffer(),
      ),
    );
    if (resp != null) {
      await upsertMsg(
        msgModel: msgModel,
        includeMsgConv: true,
      );
      return msgModel;
    }
    return null;
  }

  Future upsertMsg({
    required MsgModel msgModel,
    bool includeMsgConv = false,
  }) async {
    await isar.writeTxn((isar) async {
      if (msgModel.options.storageForClient) {
        await msgModels().put(msgModel);
      }
      if (includeMsgConv) await _updateMsgConvList([msgModel]);
    });
  }

  Future upsertMsgList({
    required List<MsgModel> msgModelList,
    bool includeMsgConv = false,
  }) async {
    await isar.writeTxn((isar) async {
      List<MsgModel> modelList = [];
      for (MsgModel msgModel in msgModelList) {
        if (msgModel.options.storageForClient) {
          modelList.add(msgModel);
        }
      }
      if (modelList.isNotEmpty) await msgModels().putAll(modelList);
      if (includeMsgConv) await _updateMsgConvList(msgModelList);
    });
  }

  Future<T?> findFirst<T>({
    required Query<T> query,
  }) async {
    if (SDKPlatform.isWeb) {
      return query.findFirst();
    }
    return query.findFirstSync();
  }

  Future<List<T>> findAll<T>({
    required Query<T> query,
  }) async {
    if (SDKPlatform.isWeb) {
      return query.findAll();
    }
    return query.findAllSync();
  }
}
