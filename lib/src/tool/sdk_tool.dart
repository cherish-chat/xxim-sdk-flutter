import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
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

  static List<int> utf8Encode(String content) {
    return utf8.encode(content);
  }

  static String utf8Decode(List<int> bytes) {
    return utf8.decode(bytes);
  }

  static List<int> aesEncode({
    required String key,
    required String iv,
    required String value,
  }) {
    Encrypter encrypter = Encrypter(AES(
      Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: "PKCS7",
    ));
    Encrypted encrypted = encrypter.encrypt(
      value,
      iv: IV.fromUtf8(iv),
    );
    return encrypted.bytes;
  }

  static String aesDecode({
    required String key,
    required String iv,
    required List<int> bytes,
  }) {
    Encrypter encrypter = Encrypter(AES(
      Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: "PKCS7",
    ));
    String source = encrypter.decrypt(
      Encrypted(Uint8List.fromList(bytes)),
      iv: IV.fromUtf8(iv),
    );
    return source;
  }
}
