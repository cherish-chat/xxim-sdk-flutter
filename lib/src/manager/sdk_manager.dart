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

class SDKManager {
  final XXIMCore xximCore;
  final Duration autoPullTime;
  final int pullMsgCount;
  final List<CollectionSchema> isarSchemas;
  final String isarDirectory;
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
    required this.autoPullTime,
    required this.pullMsgCount,
    required this.isarSchemas,
    required this.isarDirectory,
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
  late Isar isar;
  Timer? _timer;
  bool _pullStatus = false;

  /// 打开数据库
  Future openDatabase({
    required String userId,
    String? isarName,
  }) async {
    this.userId = userId;
    isarName ??= userId;
    Isar? isar = Isar.getInstance(isarName);
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
        directory: isarDirectory,
        name: isarName,
        inspector: isarInspector,
      );
    }
    isarListener?.create(this.isar);
  }

  /// 关闭数据库
  Future closeDatabase() async {
    await isar.close();
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
    List<String>? convIdList,
  }) async {
    _pullStatus = true;
    _cancelTimer();
    pullListener?.start();
    convIdList ??= await subscribeCallback.convIdList();
    if (convIdList.isEmpty) {
      pullListener?.end();
      if (_pullStatus) _startTimer();
      return;
    }
    BatchGetConvSeqResp? resp = await xximCore.batchGetConvSeq(
      reqId: SDKTool.getUUId(),
      req: BatchGetConvSeqReq(
        convIdList: convIdList,
      ),
    );
    if (resp == null || resp.convSeqMap.isEmpty) {
      pullListener?.end();
      if (_pullStatus) _startTimer();
      return;
    }
    List<BatchGetMsgListByConvIdReq_Item> items = [];
    await isar.writeTxn((isar) async {
      List<String> convIdList = resp.convSeqMap.keys.toList();
      List<RecordModel> recordModelList = await recordModels()
          .filter()
          .repeat(
            convIdList,
            (q, element) => q.convIdEqualTo(element),
          )
          .findAll();
      for (String convId in convIdList) {
        RecordModel recordModel = await _handleConvSeq(
          recordModelList,
          convId,
          resp.convSeqMap[convId]!,
        );
        int minSeq = recordModel.minSeq;
        int maxSeq = recordModel.maxSeq;
        if (recordModel.seq >= minSeq) {
          minSeq = recordModel.seq;
        }
        if (maxSeq - minSeq > pullMsgCount) {
          minSeq = maxSeq - pullMsgCount;
        }
        if (maxSeq <= minSeq) return;
        items.add(BatchGetMsgListByConvIdReq_Item(
          convId: convId,
          seqList: SDKTool.generateSeqList(minSeq, maxSeq),
        ));
      }
    });
    if (items.isNotEmpty) {
      await pullMsgDataList(items);
    }
    pullListener?.end();
    if (_pullStatus) _startTimer();
  }

  Future<RecordModel> _handleConvSeq(
    List<RecordModel> recordModelList,
    String convId,
    BatchGetConvSeqResp_ConvSeq convSeq,
  ) async {
    int index = recordModelList.indexWhere((item) {
      return item.convId == convId;
    });
    RecordModel recordModel;
    if (index != -1) {
      int minSeq = int.parse(convSeq.minSeq);
      int maxSeq = int.parse(convSeq.maxSeq);
      int updateTime = int.parse(convSeq.updateTime);
      recordModel = recordModelList[index];
      bool updated = false;
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
      if (updated) await recordModels().put(recordModel);
    } else {
      recordModel = RecordModel.fromProto(convSeq);
      await recordModels().put(recordModel);
    }
    return recordModel;
  }

  /// 关闭拉取订阅
  void closePullSubscribe() {
    _pullStatus = false;
    _cancelTimer();
  }

  Future<Map<String, AESParams>> _convAESParams(List<MsgData> msgDataList) {
    List<String> convIdList = [];
    for (MsgData msgData in msgDataList) {
      convIdList.add(msgData.convId);
    }
    return subscribeCallback.convAESParams(convIdList);
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
    Map<String, AESParams> convAESMap = await _convAESParams(resp.msgDataList);
    List<MsgModel> msgModelList = [];
    await isar.writeTxn((isar) async {
      for (MsgData msgData in resp.msgDataList) {
        msgModelList.add(await _handleMsg(msgData, convAESMap[msgData.convId]));
      }
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
    MsgData msgData = resp.msgData;
    Map<String, AESParams> convAESMap = await _convAESParams([msgData]);
    MsgModel? msgModel;
    await isar.writeTxn((isar) async {
      msgModel = await _handleMsg(msgData, convAESMap[msgData.convId]);
    });
    return msgModel;
  }

  /// 推送消息
  void onPushMsgDataList(
    List<MsgData> msgDataList,
  ) async {
    bool isFirstPull = await msgModels().count() == 0;
    Map<String, AESParams> convAESMap = await _convAESParams(msgDataList);
    List<MsgModel> msgModelList = [];
    await isar.writeTxn((isar) async {
      for (MsgData msgData in msgDataList) {
        msgModelList.add(await _handleMsg(msgData, convAESMap[msgData.convId]));
      }
    });
    if (!isFirstPull && msgModelList.isNotEmpty) {
      msgListener?.receive(msgModelList);
    }
    convListener?.update();
    calculateUnreadCount();
  }

  /// 推送通知
  void onPushNoticeDataList(
    List<NoticeData> noticeDataList,
  ) async {
    bool isFirstPull = await noticeModels().count() == 0;
    List<NoticeModel> noticeModelList = [];
    List<String> noticeIds = [];
    await isar.writeTxn((isar) async {
      for (NoticeData noticeData in noticeDataList) {
        noticeModelList.add(await _handleNotice(noticeData));
        noticeIds.add(noticeData.noticeId);
      }
    });
    if (!isFirstPull && noticeModelList.isNotEmpty) {
      bool? status = await noticeListener?.receive(noticeModelList);
      if (status == true) {
        await xximCore.ackNoticeData(
          reqId: SDKTool.getUUId(),
          req: AckNoticeDataReq(
            noticeIds: noticeIds,
          ),
        );
      }
    }
    convListener?.update();
    calculateUnreadCount();
  }

  /// 处理消息
  Future<MsgModel> _handleMsg(MsgData msgData, AESParams? aesParams) async {
    MsgModel msgModel = MsgModel.fromProto(msgData, aesParams);
    msgModel.sendStatus = SendStatus.success;
    await _updateRecord(msgModel);
    await _updateMsg(msgModel);
    if (msgData.serverMsgId.isNotEmpty) {
      await _updateRead(msgModel);
      await _updateMsgConv(msgModel);
    }
    return msgModel;
  }

  Future _updateRecord(MsgModel msgModel) async {
    RecordModel? recordModel = await recordModels()
        .filter()
        .convIdEqualTo(msgModel.convId)
        .findFirst();
    if (recordModel == null) return;
    if (msgModel.seq > recordModel.seq) {
      recordModel.seq = msgModel.seq;
      await recordModels().put(recordModel);
    }
  }

  Future _updateMsg(MsgModel msgModel) async {
    if (msgModel.options.storageForClient != true) return;
    MsgModel? model = await msgModels()
        .filter()
        .convIdEqualTo(msgModel.convId)
        .and()
        .clientMsgIdEqualTo(msgModel.clientMsgId)
        .findFirst();
    if (model != null) {
      bool updated = false;
      if (model.serverMsgId != msgModel.serverMsgId) {
        model.serverMsgId = msgModel.serverMsgId;
        updated = true;
      }
      if (model.serverTime != msgModel.serverTime) {
        model.serverTime = msgModel.serverTime;
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
      if (updated) await msgModels().put(model);
    } else {
      await msgModels().put(msgModel);
    }
  }

  Future _updateRead(MsgModel msgModel) async {
    if (msgModel.contentType != ContentType.read) return;
    ReadContent content = ReadContent.fromJson(msgModel.content);
    ReadModel? readModel = await readModels()
        .filter()
        .senderIdEqualTo(msgModel.senderId)
        .and()
        .convIdEqualTo(msgModel.convId)
        .findFirst();
    if (readModel != null) {
      if (content.seq > readModel.seq) {
        readModel.seq = content.seq;
        await readModels().put(readModel);
      }
    } else {
      readModel = ReadModel(
        senderId: msgModel.senderId,
        convId: msgModel.convId,
        seq: content.seq,
      );
      await readModels().put(readModel);
    }
  }

  Future _updateMsgConv(MsgModel msgModel) async {
    ConvModel? convModel = await convModels()
        .filter()
        .convIdEqualTo(
          msgModel.convId,
        )
        .findFirst();
    convModel ??= ConvModel(
      convId: msgModel.convId,
      convType: ConvType.msg,
    );
    MsgModel? model;
    if (convModel.clientMsgId != null) {
      model = await msgModels()
          .filter()
          .clientMsgIdEqualTo(convModel.clientMsgId!)
          .findFirst();
    }
    if (msgModel.options.updateConvMsg == true) {
      if (model != null) {
        if (msgModel.seq > model.seq) {
          convModel.clientMsgId = msgModel.clientMsgId;
          convModel.time = msgModel.serverTime;
          convModel.hidden = false;
          convModel.deleted = false;
        }
      } else {
        convModel.clientMsgId = msgModel.clientMsgId;
        convModel.time = msgModel.serverTime;
        convModel.hidden = false;
        convModel.deleted = false;
      }
    }
    if (msgModel.options.updateUnreadCount == true &&
        msgModel.senderId != userId) {
      ReadModel? readModel = await readModels()
          .filter()
          .senderIdEqualTo(userId)
          .and()
          .convIdEqualTo(msgModel.convId)
          .findFirst();
      if (readModel != null) {
        if (msgModel.seq > readModel.seq) {
          convModel.unreadCount = ++convModel.unreadCount;
        }
      } else {
        if (model != null) {
          if (msgModel.seq > model.seq) {
            convModel.unreadCount = ++convModel.unreadCount;
          }
        } else {
          convModel.unreadCount = ++convModel.unreadCount;
        }
      }
    }
    await convModels().put(convModel);
  }

  /// 处理通知
  Future<NoticeModel> _handleNotice(NoticeData noticeData) async {
    NoticeModel noticeModel = NoticeModel.fromProto(noticeData);
    await _updateNotice(noticeModel);
    await _updateNoticeConv(noticeModel);
    return noticeModel;
  }

  Future _updateNotice(NoticeModel noticeModel) async {
    if (noticeModel.options.storageForClient != true) return;
    NoticeModel? model = await noticeModels()
        .filter()
        .convIdEqualTo(noticeModel.convId)
        .and()
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
    if (noticeModel.options.updateConvMsg == true) {
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
    }
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
    List<String> convIdList = [];
    for (MsgModel msgModel in msgModelList) {
      convIdList.add(msgModel.convId);
    }
    Map<String, AESParams> convAESMap = await subscribeCallback.convAESParams(
      convIdList,
    );
    SendMsgListResp? resp = await xximCore.sendMsgList(
      reqId: SDKTool.getUUId(),
      req: SendMsgListReq(
        msgDataList: msgModelList.map((msgModel) {
          if (senderInfo != null) {
            msgModel.senderInfo = senderInfo;
          }
          AESParams? aesParams = convAESMap[msgModel.convId];
          return MsgData(
            clientMsgId: msgModel.clientMsgId,
            clientTime: msgModel.clientTime.toString(),
            serverTime: msgModel.serverTime.toString(),
            senderId: msgModel.senderId,
            senderInfo: SDKTool.utf8Encode(msgModel.senderInfo),
            convId: msgModel.convId,
            atUsers: msgModel.atUsers,
            contentType: msgModel.contentType,
            content: msgModel.options.needDecrypt == true && aesParams != null
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
    for (MsgModel msgModel in msgModelList) {
      if (resp != null) {
        msgModel.sendStatus = SendStatus.success;
      } else {
        msgModel.sendStatus = SendStatus.failed;
      }
      await upsertMsg(
        msgModel: msgModel,
        includeMsgConv: true,
      );
    }
    return resp != null;
  }

  Future upsertMsg({
    required MsgModel msgModel,
    bool includeMsgConv = false,
  }) async {
    await isar.writeTxn((isar) async {
      if (msgModel.options.storageForClient == true) {
        await msgModels().put(msgModel);
      }
      if (includeMsgConv) await _updateMsgConv(msgModel);
    });
  }
}
