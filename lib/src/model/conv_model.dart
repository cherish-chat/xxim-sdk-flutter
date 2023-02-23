import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/converter/conv_converter.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';

part 'conv_model.g.dart';

@Collection()
class ConvModel {
  int id = Isar.autoIncrement;

  @Index()
  String convId;
  @Index()
  int convType;
  @Index()
  String? clientMsgId;
  @Index()
  String? noticeId;
  int time;
  @Index()
  int unreadCount;
  @DraftConverter()
  DraftModel? draftModel;
  bool hidden;
  bool deleted;

  @Ignore()
  MsgModel? msgModel;
  @Ignore()
  NoticeModel? noticeModel;

  ConvModel({
    required this.convId,
    required this.convType,
    this.clientMsgId,
    this.noticeId,
    this.time = 0,
    this.unreadCount = 0,
    this.draftModel,
    this.hidden = false,
    this.deleted = false,
  });

  static ConvModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    DraftModel? draftModel;
    if (map["draftModel"].toString().isNotEmpty) {
      draftModel = DraftModel.fromJson(map["draftModel"]);
    }
    return ConvModel(
      convId: map["convId"],
      convType: map["convType"],
      clientMsgId: map["clientMsgId"],
      noticeId: map["noticeId"],
      time: map["time"],
      unreadCount: map["unreadCount"],
      draftModel: draftModel,
      hidden: map["hidden"],
      deleted: map["deleted"],
    );
  }

  String toJson() {
    return json.encode({
      "convId": convId,
      "convType": convType,
      "clientMsgId": clientMsgId ?? "",
      "noticeId": noticeId ?? "",
      "time": time,
      "unreadCount": unreadCount,
      "draftModel": draftModel?.toJson() ?? "",
      "hidden": hidden,
      "deleted": deleted,
    });
  }
}

class DraftModel {
  String content;
  String ext;

  DraftModel({
    this.content = "",
    this.ext = "",
  });

  static DraftModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return DraftModel(
      content: map["content"],
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "content": content,
      "ext": ext,
    });
  }
}
