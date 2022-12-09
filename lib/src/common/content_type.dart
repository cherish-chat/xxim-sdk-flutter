/// 内容类型
class ContentType {
  static const int unknown = 0; // 未知类型
  static const int typing = 1; // 正在输入
  static const int read = 2; // 已读
  static const int revoke = 3; // 撤回

  static const int text = 11; // 文本
  static const int image = 12; // 图片
  static const int audio = 13; // 语音
  static const int video = 14; // 视频
  static const int file = 15; // 文件
  static const int location = 16; // 位置
  static const int card = 17; // 名片
  static const int merge = 18; // 合并
  static const int emoji = 19; // 表情
  static const int command = 20; // 命令
  static const int richTxt = 21; // 富文本
  static const int markdown = 22; // markdown

  static const int custom = 100; // 自定义消息
}
