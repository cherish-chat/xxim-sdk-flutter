/// 订阅回调
class SubscribeCallback {
  final Future<List<String>> Function() onConvIdList; // 会话Id列表

  SubscribeCallback({
    required this.onConvIdList,
  });

  Future<List<String>> convIdList() {
    return onConvIdList();
  }
}
