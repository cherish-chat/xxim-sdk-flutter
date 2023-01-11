import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';

class AtUsersConverter extends TypeConverter<List<String>, String> {
  const AtUsersConverter();

  @override
  List<String> fromIsar(String object) {
    Map<String, List<String>> map = json.decode(object);
    List<String> list = map["list"]!;
    return list;
  }

  @override
  String toIsar(List<String> object) {
    return json.encode({
      "list": object,
    });
  }
}

class MsgOptionsConverter extends TypeConverter<MsgOptionsModel, String> {
  const MsgOptionsConverter();

  @override
  MsgOptionsModel fromIsar(String object) {
    return MsgOptionsModel.fromJson(object);
  }

  @override
  String toIsar(MsgOptionsModel object) {
    return object.toJson();
  }
}

class MsgOfflinePushConverter
    extends TypeConverter<MsgOfflinePushModel, String> {
  const MsgOfflinePushConverter();

  @override
  MsgOfflinePushModel fromIsar(String object) {
    return MsgOfflinePushModel.fromJson(object);
  }

  @override
  String toIsar(MsgOfflinePushModel object) {
    return object.toJson();
  }
}
