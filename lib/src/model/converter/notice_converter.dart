import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';

class NoticeOptionsConverter extends TypeConverter<NoticeOptionsModel, String> {
  const NoticeOptionsConverter();

  @override
  NoticeOptionsModel fromIsar(String object) {
    return NoticeOptionsModel.fromJson(object);
  }

  @override
  String toIsar(NoticeOptionsModel object) {
    return object.toJson();
  }
}
