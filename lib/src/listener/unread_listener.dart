/// 未读监听
class UnreadListener {
  final Function(int count) onUnreadCount; // 未读数量

  UnreadListener({
    required this.onUnreadCount,
  });

  void unreadCount(int count) {
    onUnreadCount(count);
  }
}
