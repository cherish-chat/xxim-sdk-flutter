/// 拉取监听
class PullListener {
  final Function() onStart; // 开始
  final Function() onEnd; // 结束

  PullListener({
    required this.onStart,
    required this.onEnd,
  });

  void start() {
    onStart();
  }

  void end() {
    onEnd();
  }
}
