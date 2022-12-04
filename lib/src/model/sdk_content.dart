import 'dart:convert';

/// 正在输入
class TypingContent {
  bool focus;

  TypingContent({
    required this.focus,
  });

  static TypingContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return TypingContent(focus: map["focus"]);
  }

  String toJson() {
    return json.encode({
      "focus": focus,
    });
  }
}

/// 已读消息
class ReadContent {
  int seq;

  ReadContent({
    required this.seq,
  });

  static ReadContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return ReadContent(seq: map["seq"]);
  }

  String toJson() {
    return json.encode({
      "seq": seq,
    });
  }
}

/// 撤回消息
class RevokeContent {
  String content;

  RevokeContent({
    required this.content,
  });

  static RevokeContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RevokeContent(
      content: map["content"],
    );
  }

  String toJson() {
    return json.encode({
      "content": content,
    });
  }
}
