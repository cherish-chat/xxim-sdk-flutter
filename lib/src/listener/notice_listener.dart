import 'package:xxim_sdk_flutter/src/model/notice_model.dart';

/// 通知监听
class NoticeListener {
  final Future<bool> Function(
    List<NoticeModel> noticeModelList,
  ) onReceive; // 接收

  NoticeListener({
    required this.onReceive,
  });

  Future<bool> receive(List<NoticeModel> noticeModelList) {
    return onReceive(noticeModelList);
  }
}
