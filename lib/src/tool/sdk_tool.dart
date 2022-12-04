import 'dart:convert';
import 'package:uuid/uuid.dart';

class SDKTool {
  static const Uuid _uuid = Uuid();

  static String getClientMsgId() {
    return _uuid.v1().replaceAll("-", "");
  }

  static List<String> generateSeqList(int minSeq, int maxSeq) {
    return List.generate(maxSeq - minSeq, (index) {
      return (minSeq + 1 + index).toString();
    });
  }

  static List<int> encode(String content) {
    return utf8.encode(content);
  }

  static String decode(dynamic content) {
    if (content is List<int>) {
      return utf8.decode(content);
    }
    return content;
  }
}
