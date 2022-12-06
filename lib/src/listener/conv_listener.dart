/// 会话监听
class ConvListener {
  final Function() onUpdate; // 更新会话

  ConvListener({
    required this.onUpdate,
  });

  void update() {
    onUpdate();
  }
}
