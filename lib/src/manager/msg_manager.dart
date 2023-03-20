import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/common/content_type.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/record_model.dart';
import 'package:xxim_sdk_flutter/src/model/sdk_content.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';

class MsgManager {
  final SDKManager _sdkManager;

  MsgManager(this._sdkManager);

  /// 获取消息列表
  Future<List<MsgModel>> getMsgList({
    required String convId,
    int? contentType,
    int? maxSeq,
    int size = 25,
    bool padding = true,
  }) async {
    bool includeUpper = maxSeq == null;
    if (maxSeq == null) {
      MsgModel? msgModel = await getFirstMsg(
        convId: convId,
      );
      if (msgModel != null) {
        maxSeq = msgModel.seq;
      } else {
        RecordModel? recordModel = await _sdkManager.findFirst(
          query: _sdkManager
              .recordModels()
              .filter()
              .convIdEqualTo(
                convId,
              )
              .build(),
        );
        if (recordModel != null) {
          maxSeq = recordModel.maxSeq;
        }
      }
    }
    if (maxSeq == null) return [];
    RecordModel? recordModel = await _sdkManager.findFirst(
      query: _sdkManager
          .recordModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    int minSeq = maxSeq - size;
    if (recordModel != null) {
      minSeq = minSeq > recordModel.minSeq ? minSeq : recordModel.minSeq;
    } else {
      minSeq = minSeq > 0 ? minSeq : 0;
    }
    if (minSeq < 0) minSeq = 0;
    if (maxSeq <= minSeq) return [];
    if (padding) {
      List<String> expectList = SDKTool.generateSeqList(minSeq, maxSeq);
      List<MsgModel> localList = await _getMsgList(
        convId,
        contentType,
        minSeq,
        maxSeq,
      );
      if (expectList.length - localList.length != 0) {
        List<String> seqList = [];
        for (String seq in expectList) {
          int index = localList.indexWhere((msgModel) {
            return seq == msgModel.seq.toString();
          });
          if (index == -1) {
            seqList.add(seq);
          }
        }
        if (seqList.isNotEmpty) {
          await _sdkManager.pullMsgDataList(
            [
              BatchGetMsgListByConvIdReq_Item(
                convId: convId,
                seqList: seqList,
              ),
            ],
          );
        }
      }
    }
    return _getMsgList(
      convId,
      contentType,
      minSeq,
      maxSeq,
      includeUpper: includeUpper,
      deleted: false,
    );
  }

  Future<List<MsgModel>> _getMsgList(
    String convId,
    int? contentType,
    int minSeq,
    int maxSeq, {
    bool includeUpper = true,
    bool? deleted,
  }) {
    return _sdkManager.findAll(
      query: _sdkManager.msgModels().buildQuery<MsgModel>(
        filter: FilterGroup.and([
          FilterCondition(
            type: ConditionType.eq,
            property: "convId",
            value: convId,
          ),
          if (contentType != null)
            FilterCondition(
              type: ConditionType.eq,
              property: "contentType",
              value: contentType,
            ),
          FilterCondition.between(
            property: "seq",
            lower: minSeq,
            includeLower: false,
            upper: maxSeq,
            includeUpper: includeUpper,
          ),
          if (deleted != null)
            FilterCondition(
              type: ConditionType.eq,
              property: "deleted",
              value: deleted,
            ),
        ]),
        sortBy: [
          const SortProperty(
            property: "seq",
            sort: Sort.desc,
          ),
        ],
      ),
    );
  }

  /// 获取首个消息
  Future<MsgModel?> getFirstMsg({
    required String convId,
  }) {
    return _sdkManager.findFirst(
      query: _sdkManager
          .msgModels()
          .filter()
          .convIdEqualTo(convId)
          .sortBySeqDesc()
          .build(),
    );
  }

  /// 获取单条消息
  Future<MsgModel?> getSingleMsg({
    required String clientMsgId,
  }) {
    return _sdkManager.findFirst(
      query: _sdkManager
          .msgModels()
          .filter()
          .clientMsgIdEqualTo(clientMsgId)
          .build(),
    );
  }

  /// 获取多条消息
  Future<List<MsgModel>> getMultipleMsg({
    required List<String> clientMsgIdList,
  }) {
    return _sdkManager.findAll(
      query: _sdkManager
          .msgModels()
          .filter()
          .repeat(
            clientMsgIdList,
            (q, element) => q.clientMsgIdEqualTo(element),
          )
          .build(),
    );
  }

  /// 拉取云端消息
  Future<MsgModel?> pullCloudMsg({
    required String clientMsgId,
  }) {
    return _sdkManager.pullMsgDataById(
      clientMsgId: clientMsgId,
    );
  }

  /// 创建正在输入
  Future<MsgModel> createTyping({
    required String convId,
    required TypingContent content,
    MsgOptionsModel? options,
    MsgOfflinePushModel? offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      convId: convId,
      atUsers: [],
      contentType: MsgContentType.typing,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: false,
            storageForClient: false,
            needDecrypt: false,
            offlinePush: false,
            updateConvMsg: false,
            updateUnreadCount: false,
          ),
      offlinePush: offlinePush ??
          MsgOfflinePushModel(
            title: "",
            content: "",
            payload: "",
          ),
      ext: ext,
    );
  }

  /// 发送正在输入
  Future<bool> sendTyping({
    required String convId,
    required TypingContent content,
    MsgOptionsModel? options,
    MsgOfflinePushModel? offlinePush,
    String ext = "",
  }) async {
    return sendMsgList(
      msgModelList: [
        await createTyping(
          convId: convId,
          content: content,
          options: options,
          offlinePush: offlinePush,
          ext: ext,
        ),
      ],
    );
  }

  /// 创建提示消息
  Future<MsgModel> createTip({
    required String convId,
    required TipContent content,
    MsgOptionsModel? options,
    MsgOfflinePushModel? offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      convId: convId,
      atUsers: [],
      contentType: MsgContentType.tip,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: false,
            updateConvMsg: false,
            updateUnreadCount: false,
          ),
      offlinePush: offlinePush ??
          MsgOfflinePushModel(
            title: "",
            content: "",
            payload: "",
          ),
      ext: ext,
    );
  }

  /// 发送提示消息
  Future<bool> sendTip({
    required String convId,
    required TipContent content,
    MsgOptionsModel? options,
    MsgOfflinePushModel? offlinePush,
    String ext = "",
  }) async {
    return sendMsgList(
      msgModelList: [
        await createTip(
          convId: convId,
          content: content,
          options: options,
          offlinePush: offlinePush,
          ext: ext,
        ),
      ],
    );
  }

  /// 创建文本消息
  Future<MsgModel> createText({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required String text,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.text,
      content: text,
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建图片消息
  Future<MsgModel> createImage({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required ImageContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.image,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建语音消息
  Future<MsgModel> createAudio({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required AudioContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.audio,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建视频消息
  Future<MsgModel> createVideo({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required VideoContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.video,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建文件消息
  Future<MsgModel> createFile({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required FileContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.file,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建位置消息
  Future<MsgModel> createLocation({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required LocationContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.location,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建名片消息
  Future<MsgModel> createCard({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required CardContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.card,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建合并消息
  Future<MsgModel> createMerge({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required MergeContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.merge,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建表情消息
  Future<MsgModel> createEmoji({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required EmojiContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.emoji,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建命令消息
  Future<MsgModel> createCommand({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required CommandContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.command,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建富文本消息
  Future<MsgModel> createRichText({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required RichTextContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.richText,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建标记消息
  Future<MsgModel> createMarkdown({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required MarkdownContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.markdown,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建自定义消息
  Future<MsgModel> createCustom({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required CustomContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: MsgContentType.custom,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: false,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 发送消息列表
  Future<bool> sendMsgList({
    String? senderInfo,
    required List<MsgModel> msgModelList,
    int deliverAfter = 0,
  }) {
    return _sdkManager.sendMsgList(
      senderInfo: senderInfo,
      msgModelList: msgModelList,
      deliverAfter: deliverAfter,
    );
  }

  /// 发送已读消息
  Future<bool> sendReadMsg({
    required ReadContent content,
  }) {
    return _sdkManager.sendReadMsg(content);
  }

  /// 发送撤回消息
  Future<MsgModel?> sendRevokeMsg({
    required String clientMsgId,
    required TipContent content,
  }) async {
    MsgModel? msgModel = await getSingleMsg(
      clientMsgId: clientMsgId,
    );
    if (msgModel == null || msgModel.serverMsgId == null) return null;
    msgModel.contentType = MsgContentType.tip;
    msgModel.content = content.toJson();
    return sendEditMsg(msgModel: msgModel);
  }

  /// 发送编辑消息
  Future<MsgModel?> sendEditMsg({
    required MsgModel msgModel,
  }) {
    return _sdkManager.sendEditMsg(msgModel);
  }

  /// 更新插入消息
  Future upsertMsg({
    required MsgModel msgModel,
    bool includeMsgConv = false,
  }) {
    return _sdkManager.upsertMsg(
      msgModel: msgModel,
      includeMsgConv: includeMsgConv,
    );
  }

  /// 更新插入消息列表
  Future upsertMsgList({
    required List<MsgModel> msgModelList,
    bool includeMsgConv = false,
  }) {
    return _sdkManager.upsertMsgList(
      msgModelList: msgModelList,
      includeMsgConv: includeMsgConv,
    );
  }

  /// 删除消息
  Future deleteMsg({
    required String clientMsgId,
  }) async {
    MsgModel? msgModel = await _sdkManager.findFirst(
      query: _sdkManager
          .msgModels()
          .filter()
          .clientMsgIdEqualTo(clientMsgId)
          .build(),
    );
    if (msgModel == null) return;
    msgModel.contentType = MsgContentType.unknown;
    msgModel.content = "";
    msgModel.deleted = true;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.msgModels().put(msgModel);
    });
  }

  /// 清空消息
  Future clearMsg({
    required String convId,
  }) async {
    List<MsgModel> list = await _sdkManager.findAll(
      query: _sdkManager
          .msgModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (list.isEmpty) return;
    await _sdkManager.isar.writeTxn((isar) async {
      for (MsgModel msgModel in list) {
        msgModel.contentType = MsgContentType.unknown;
        msgModel.content = "";
        msgModel.deleted = true;
      }
      await _sdkManager.msgModels().putAll(list);
    });
  }
}
