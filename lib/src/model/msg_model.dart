import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/common/aes_params.dart';
import 'package:xxim_sdk_flutter/src/common/send_status.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';

part 'msg_model.g.dart';

@Collection()
class MsgModel {
  Id id = Isar.autoIncrement;

  @Index()
  String clientMsgId;
  String? serverMsgId;
  int clientTime;
  int serverTime;
  @Index()
  String senderId;
  String senderInfo;
  @Index()
  String convId;
  List<String> atUsers;
  @Index()
  int contentType;
  @Index()
  String content;
  int seq;
  MsgOptionsModel options;
  MsgOfflinePushModel offlinePush;
  String ext;
  int sendStatus;
  int sendProgress;
  bool deleted;

  MsgModel({
    required this.clientMsgId,
    this.serverMsgId,
    required this.clientTime,
    required this.serverTime,
    required this.senderId,
    this.senderInfo = "",
    required this.convId,
    required this.atUsers,
    required this.contentType,
    required this.content,
    required this.seq,
    required this.options,
    required this.offlinePush,
    this.ext = "",
    this.sendStatus = SendStatus.sending,
    this.sendProgress = 0,
    this.deleted = false,
  });

  static MsgModel fromProto(MsgData msgData, AESParams? aesParams) {
    MsgOptionsModel options = MsgOptionsModel.fromProto(msgData.options);
    return MsgModel(
      clientMsgId: msgData.clientMsgId,
      serverMsgId: msgData.serverMsgId,
      clientTime: int.parse(msgData.clientTime),
      serverTime: int.parse(msgData.serverTime),
      senderId: msgData.senderId,
      senderInfo: SDKTool.utf8Decode(msgData.senderInfo),
      convId: msgData.convId,
      atUsers: msgData.atUsers,
      contentType: msgData.contentType,
      content: options.needDecrypt == true && aesParams != null
          ? SDKTool.aesDecode(
              key: aesParams.key,
              iv: aesParams.iv,
              bytes: msgData.content,
            )
          : SDKTool.utf8Decode(msgData.content),
      seq: int.parse(msgData.seq),
      options: options,
      offlinePush: MsgOfflinePushModel.fromProto(msgData.offlinePush),
      ext: SDKTool.utf8Decode(msgData.ext),
    );
  }
}

@Embedded()
class MsgOptionsModel {
  bool? storageForServer;
  bool? storageForClient;
  bool? needDecrypt;
  bool? offlinePush;
  bool? updateConvMsg;
  bool? updateUnreadCount;

  MsgOptionsModel({
    this.storageForServer,
    this.storageForClient,
    this.needDecrypt,
    this.offlinePush,
    this.updateConvMsg,
    this.updateUnreadCount,
  });

  static MsgOptionsModel fromProto(MsgData_Options options) {
    return MsgOptionsModel(
      storageForServer: options.storageForServer,
      storageForClient: options.storageForClient,
      needDecrypt: options.needDecrypt,
      offlinePush: options.offlinePush,
      updateConvMsg: options.updateConvMsg,
      updateUnreadCount: options.updateUnreadCount,
    );
  }
}

@Embedded()
class MsgOfflinePushModel {
  String? title;
  String? content;
  String? payload;

  MsgOfflinePushModel({
    this.title,
    this.content,
    this.payload,
  });

  static MsgOfflinePushModel fromProto(MsgData_OfflinePush offlinePush) {
    return MsgOfflinePushModel(
      title: offlinePush.title,
      content: offlinePush.content,
      payload: offlinePush.payload,
    );
  }
}
