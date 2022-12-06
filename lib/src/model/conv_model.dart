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
  int convType;
  @Index()
  String? clientMsgId;
  @Index()
  String? noticeId;
  int time;
  @Index()
  int unreadCount;
  DraftModel? draftModel;
  bool hidden;
  bool deleted;

  @ignore
  MsgModel? msgModel;
  @ignore
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
}

@Embedded()
class DraftModel {
  String? content;
  String? ext;

  DraftModel({
    this.content,
    this.ext,
  });
}
