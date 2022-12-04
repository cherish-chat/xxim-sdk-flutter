import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';

part 'conv_model.g.dart';

@Collection()
class ConvModel {
  Id id = Isar.autoIncrement;

  @Index()
  String convId;
  @Index()
  String? msgId;
  @Index()
  String? noticeId;
  @Index()
  int unreadCount;
  DraftModel? draftModel;
  bool hidden;

  @ignore
  MsgModel? msgModel;
  @ignore
  NoticeModel? noticeModel;

  ConvModel({
    required this.convId,
    this.msgId,
    this.noticeId,
    this.unreadCount = 0,
    this.draftModel,
    this.hidden = false,
  });
}

@Embedded()
class DraftModel {
  String? content;
  int? time;

  DraftModel({
    this.content,
    this.time,
  });
}
