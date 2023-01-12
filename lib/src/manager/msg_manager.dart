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
    int size = 100,
  }) async {
    bool includeUpper = maxSeq == null;
    if (maxSeq == null) {
      MsgModel? msgModel = await getFirstMsg(
        convId: convId,
      );
      if (msgModel != null) {
        maxSeq = msgModel.seq;
      } else {
        RecordModel? recordModel = await _sdkManager
            .recordModels()
            .filter()
            .convIdEqualTo(convId)
            .findFirst();
        if (recordModel != null) {
          maxSeq = recordModel.maxSeq;
        }
      }
    }
    if (maxSeq == null) return [];
    RecordModel? recordModel = await _sdkManager
        .recordModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    int minSeq = maxSeq - size;
    if (recordModel != null) {
      minSeq = minSeq > recordModel.minSeq ? minSeq : recordModel.minSeq;
    } else {
      minSeq = minSeq > 0 ? minSeq : 0;
    }
    if (minSeq < 0) minSeq = 0;
    if (maxSeq <= minSeq) return [];
    List<String> expectList = SDKTool.generateSeqList(minSeq, maxSeq);
    List<MsgModel> list = await _getMsgList(
      convId,
      contentType,
      minSeq,
      maxSeq,
    );
    if (expectList.length - list.length != 0) {
      List<String> seqList = [];
      for (String seq in expectList) {
        int index = list.indexWhere((msgModel) {
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
    return _sdkManager.msgModels().buildQuery<MsgModel>(
      filter: FilterGroup.and([
        FilterCondition.equalTo(
          property: "convId",
          value: convId,
        ),
        if (contentType != null)
          FilterCondition.equalTo(
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
          FilterCondition.equalTo(
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
    ).findAll();
  }

  /// 获取首个消息
  Future<MsgModel?> getFirstMsg({
    required String convId,
  }) {
    return _sdkManager
        .msgModels()
        .filter()
        .convIdEqualTo(convId)
        .sortBySeqDesc()
        .findFirst();
  }

  /// 获取单条消息
  Future<MsgModel?> getSingleMsg({
    required String clientMsgId,
  }) {
    return _sdkManager
        .msgModels()
        .filter()
        .clientMsgIdEqualTo(clientMsgId)
        .findFirst();
  }

  /// 获取多条消息
  Future<List<MsgModel>> getMultipleMsg({
    required List<String> clientMsgIdList,
  }) {
    return _sdkManager
        .msgModels()
        .filter()
        .anyOf(
          clientMsgIdList,
          (q, element) => q.clientMsgIdEqualTo(element),
        )
        .findAll();
  }

  /// 拉取云端消息
  Future<MsgModel?> pullCloudMsg({
    required String clientMsgId,
  }) {
    return _sdkManager.pullMsgDataById(
      clientMsgId: clientMsgId,
    );
  }

  /// 发送正在输入
  Future<bool> sendTyping({
    required String convId,
    required TypingContent content,
    String ext = "",
  }) async {
    return sendMsgList(
      msgModelList: [
        await _sdkManager.createMsg(
          convId: convId,
          atUsers: [],
          contentType: ContentType.typing,
          content: content.toJson(),
          options: MsgOptionsModel(
            storageForServer: false,
            storageForClient: false,
            needDecrypt: false,
            offlinePush: false,
            updateConvMsg: false,
            updateUnreadCount: false,
          ),
          offlinePush: MsgOfflinePushModel(
            title: "",
            content: "",
            payload: "",
          ),
          ext: ext,
        ),
      ],
    );
  }

  /// 发送已读消息
  Future<bool> sendRead({
    required String convId,
    required ReadContent content,
    bool storageForServer = true,
    bool storageForClient = true,
    String ext = "",
  }) async {
    return sendMsgList(
      msgModelList: [
        await _sdkManager.createMsg(
          convId: convId,
          atUsers: [],
          contentType: ContentType.read,
          content: content.toJson(),
          options: MsgOptionsModel(
            storageForServer: storageForServer,
            storageForClient: storageForClient,
            needDecrypt: false,
            offlinePush: false,
            updateConvMsg: false,
            updateUnreadCount: false,
          ),
          offlinePush: MsgOfflinePushModel(
            title: "",
            content: "",
            payload: "",
          ),
          ext: ext,
        ),
      ],
    );
  }

  /// 发送撤回消息
  Future<bool> sendRevoke({
    required String clientMsgId,
    required RevokeContent content,
    String ext = "",
  }) async {
    MsgModel? msgModel = await getSingleMsg(
      clientMsgId: clientMsgId,
    );
    if (msgModel == null) return false;
    if (content.contentType == null && content.content == null) {
      content.contentType = msgModel.contentType;
      content.content = msgModel.content;
    }
    msgModel.contentType = ContentType.revoke;
    msgModel.content = content.toJson();
    msgModel.offlinePush.content = content.content;
    msgModel.ext = ext;
    return sendMsgList(
      msgModelList: [
        msgModel,
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
      contentType: ContentType.text,
      content: text,
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.image,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.audio,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.video,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.file,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.location,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.card,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.merge,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.emoji,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.command,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
            offlinePush: true,
            updateConvMsg: true,
            updateUnreadCount: true,
          ),
      offlinePush: offlinePush,
      ext: ext,
    );
  }

  /// 创建富文本消息
  Future<MsgModel> createRichTxt({
    String senderInfo = "",
    required String convId,
    List<String> atUsers = const [],
    required RichTxtContent content,
    MsgOptionsModel? options,
    required MsgOfflinePushModel offlinePush,
    String ext = "",
  }) {
    return _sdkManager.createMsg(
      senderInfo: senderInfo,
      convId: convId,
      atUsers: atUsers,
      contentType: ContentType.richTxt,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.markdown,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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
      contentType: ContentType.custom,
      content: content.toJson(),
      options: options ??
          MsgOptionsModel(
            storageForServer: true,
            storageForClient: true,
            needDecrypt: true,
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

  /// 更新消息
  Future upsertMsg({
    required MsgModel msgModel,
    bool includeMsgConv = false,
  }) {
    return _sdkManager.upsertMsg(
      msgModel: msgModel,
      includeMsgConv: includeMsgConv,
    );
  }

  /// 删除消息
  Future deleteMsg({
    required String clientMsgId,
  }) async {
    MsgModel? msgModel = await _sdkManager
        .msgModels()
        .filter()
        .clientMsgIdEqualTo(clientMsgId)
        .findFirst();
    if (msgModel == null) return;
    msgModel.contentType = ContentType.unknown;
    msgModel.content = "";
    msgModel.deleted = true;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.msgModels().put(msgModel);
    });
  }

  /// 清空消息
  Future clearMsg({
    required String convId,
  }) async {
    List<MsgModel> list = await _sdkManager
        .msgModels()
        .filter()
        .convIdEqualTo(
          convId,
        )
        .findAll();
    if (list.isEmpty) return;
    await _sdkManager.isar.writeTxn(() async {
      for (MsgModel msgModel in list) {
        msgModel.contentType = ContentType.unknown;
        msgModel.content = "";
        msgModel.deleted = true;
      }
      await _sdkManager.msgModels().putAll(list);
    });
  }
}
