import 'package:xxim_sdk_flutter/src/model/msg_model.dart';

/// 消息监听
class MsgListener {
  final Function(
    List<MsgModel> msgModelList,
  ) onReceive; // 接收

  MsgListener({
    required this.onReceive,
  });

  void receive(List<MsgModel> msgModelList) {
    onReceive(msgModelList);
  }
}
