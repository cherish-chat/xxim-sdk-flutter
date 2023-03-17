import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

class SDKTool {
  static const Uuid _uuid = Uuid();
  static const String _separator = "-";
  static const String _singlePrefix = "single:";
  static const String _groupPrefix = "group:";

  static String getUUId() {
    return _uuid.v1().replaceAll("-", "");
  }

  static String singleConvId(String id1, String id2) {
    if (id1.compareTo(id2) < 0) {
      return _singlePrefix + id1 + _separator + id2;
    }
    return _singlePrefix + id2 + _separator + id1;
  }

  static String getSingleId(String convId, String selfId) {
    List<String> splitList = convId
        .trimLeft()
        .substring(
          _singlePrefix.length,
        )
        .split(_separator);
    if (splitList.length == 2) {
      if (splitList[0] == selfId) {
        return splitList[1];
      }
      return splitList[0];
    }
    return '';
  }

  static bool isSingleConv(String convId) {
    return convId.startsWith(_singlePrefix);
  }

  static String groupConvId(String id) {
    return _groupPrefix + id;
  }

  static String getGroupId(String convId) {
    return convId.trimLeft().substring(_groupPrefix.length);
  }

  static bool isGroupConv(String convId) {
    return convId.startsWith(_groupPrefix);
  }

  static List<String> generateSeqList(int minSeq, int maxSeq) {
    return List.generate(maxSeq - minSeq, (index) {
      return (minSeq + 1 + index).toString();
    });
  }

  static List<int> utf8Encode(String value) {
    try {
      return utf8.encode(value);
    } catch (_) {
      return [];
    }
  }

  static String utf8Decode(List<int> bytes) {
    try {
      return utf8.decode(bytes);
    } catch (_) {
      return "";
    }
  }

  static List<int> aesEncode({
    required String key,
    required String iv,
    required String value,
  }) {
    try {
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
    } catch (_) {}
    return utf8Encode(value);
  }

  static String aesDecode({
    required String key,
    required String iv,
    required List<int> bytes,
  }) {
    try {
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
    } catch (_) {}
    return utf8Decode(bytes);
  }
}
