import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/common/aes_params.dart';
import 'package:xxim_sdk_flutter/src/common/send_status.dart';
import 'package:xxim_sdk_flutter/src/model/converter/msg_converter.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';

part 'msg_model.g.dart';

@Collection()
class MsgModel {
  int id = Isar.autoIncrement;

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
  @AtUsersConverter()
  List<String> atUsers;
  @Index()
  int contentType;
  @Index()
  String content;
  int seq;
  @MsgOptionsConverter()
  MsgOptionsModel options;
  @MsgOfflinePushConverter()
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

  static MsgModel fromProto(MsgData msgData, AesParams? aesParams) {
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
      content: options.needDecrypt && aesParams != null
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

  static MsgModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgModel(
      clientMsgId: map["clientMsgId"],
      serverMsgId: map["serverMsgId"],
      clientTime: map["clientTime"],
      serverTime: map["serverTime"],
      senderId: map["senderId"],
      senderInfo: map["senderInfo"],
      convId: map["convId"],
      atUsers: (map["atUsers"] ?? []).cast<String>(),
      contentType: map["contentType"],
      content: map["content"],
      seq: map["seq"],
      options: MsgOptionsModel.fromJson(map["options"]),
      offlinePush: MsgOfflinePushModel.fromJson(map["offlinePush"]),
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "clientMsgId": clientMsgId,
      "serverMsgId": serverMsgId ?? "",
      "clientTime": clientTime,
      "serverTime": serverTime,
      "senderId": senderId,
      "senderInfo": senderInfo,
      "convId": convId,
      "atUsers": atUsers,
      "contentType": contentType,
      "content": content,
      "seq": seq,
      "options": options.toJson(),
      "offlinePush": offlinePush.toJson(),
      "ext": ext,
    });
  }
}

class MsgOptionsModel {
  bool storageForServer;
  bool storageForClient;
  bool needDecrypt;
  bool offlinePush;
  bool updateConvMsg;
  bool updateUnreadCount;

  MsgOptionsModel({
    this.storageForServer = false,
    this.storageForClient = false,
    this.needDecrypt = false,
    this.offlinePush = false,
    this.updateConvMsg = false,
    this.updateUnreadCount = false,
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

  static MsgOptionsModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgOptionsModel(
      storageForServer: map["storageForServer"],
      storageForClient: map["storageForClient"],
      needDecrypt: map["needDecrypt"],
      offlinePush: map["offlinePush"],
      updateConvMsg: map["updateConvMsg"],
      updateUnreadCount: map["updateUnreadCount"],
    );
  }

  String toJson() {
    return json.encode({
      "storageForServer": storageForServer,
      "storageForClient": storageForClient,
      "needDecrypt": needDecrypt,
      "offlinePush": offlinePush,
      "updateConvMsg": updateConvMsg,
      "updateUnreadCount": updateUnreadCount,
    });
  }
}

class MsgOfflinePushModel {
  String title;
  String content;
  String payload;

  MsgOfflinePushModel({
    this.title = "",
    this.content = "",
    this.payload = "",
  });

  static MsgOfflinePushModel fromProto(MsgData_OfflinePush offlinePush) {
    return MsgOfflinePushModel(
      title: offlinePush.title,
      content: offlinePush.content,
      payload: offlinePush.payload,
    );
  }

  static MsgOfflinePushModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return MsgOfflinePushModel(
      title: map["title"],
      content: map["content"],
      payload: map["payload"],
    );
  }

  String toJson() {
    return json.encode({
      "title": title,
      "content": content,
      "payload": payload,
    });
  }
}
