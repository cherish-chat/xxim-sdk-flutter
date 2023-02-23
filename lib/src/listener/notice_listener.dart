import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';
import 'package:xxim_sdk_flutter/src/model/sdk_content.dart';

/// 通知监听
class NoticeListener {
  final Future<bool> Function(
    ReadContent readContent,
  ) onReadMsg; // 已读消息
  final Future<bool> Function(
    MsgModel msgModel,
  ) onEditMsg; // 编辑消息
  final Future<bool> Function(
    NoticeModel noticeModel,
  ) onReceive; // 接收

  NoticeListener({
    required this.onReadMsg,
    required this.onEditMsg,
    required this.onReceive,
  });

  Future<bool> readMsg(ReadContent readContent) {
    return onReadMsg(readContent);
  }

  Future<bool> editMsg(MsgModel msgModel) {
    return onEditMsg(msgModel);
  }

  Future<bool> receive(NoticeModel noticeModel) {
    return onReceive(noticeModel);
  }
}
