import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/model/converter/notice_converter.dart';
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';

part 'notice_model.g.dart';

@Collection()
class NoticeModel {
  int id = Isar.autoIncrement;

  @Index()
  String convId;
  @Index()
  String noticeId;
  int createTime;
  String title;
  int contentType;
  String content;
  @NoticeOptionsConverter()
  NoticeOptionsModel options;
  String ext;
  bool deleted;

  NoticeModel({
    required this.convId,
    required this.noticeId,
    required this.createTime,
    required this.title,
    required this.contentType,
    required this.content,
    required this.options,
    required this.ext,
    this.deleted = false,
  });

  static NoticeModel fromProto(NoticeData noticeData) {
    return NoticeModel(
      convId: noticeData.convId,
      noticeId: noticeData.noticeId,
      createTime: int.parse(noticeData.createTime),
      title: noticeData.title,
      contentType: noticeData.contentType,
      content: SDKTool.utf8Decode(noticeData.content),
      options: NoticeOptionsModel.fromProto(noticeData.options),
      ext: SDKTool.utf8Decode(noticeData.ext),
    );
  }

  static NoticeModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return NoticeModel(
      convId: map["convId"],
      noticeId: map["noticeId"],
      createTime: map["createTime"],
      title: map["title"],
      contentType: map["contentType"],
      content: map["content"],
      options: NoticeOptionsModel.fromJson(map["options"]),
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "convId": convId,
      "noticeId": noticeId,
      "createTime": createTime,
      "title": title,
      "contentType": contentType,
      "content": content,
      "options": options.toJson(),
      "ext": ext,
    });
  }
}

class NoticeOptionsModel {
  bool storageForClient;
  bool updateConvNotice;

  NoticeOptionsModel({
    this.storageForClient = false,
    this.updateConvNotice = false,
  });

  static NoticeOptionsModel fromProto(NoticeData_Options options) {
    return NoticeOptionsModel(
      storageForClient: options.storageForClient,
      updateConvNotice: options.updateConvNotice,
    );
  }

  static NoticeOptionsModel fromJson(String source) {
    Map<String, dynamic> map = json.decode(source);
    return NoticeOptionsModel(
      storageForClient: map["storageForClient"],
      updateConvNotice: map["updateConvNotice"],
    );
  }

  String toJson() {
    return json.encode({
      "storageForClient": storageForClient,
      "updateConvNotice": updateConvNotice,
    });
  }
}
