import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';

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
