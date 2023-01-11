import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/model/conv_model.dart';

class DraftConverter extends TypeConverter<DraftModel?, String> {
  const DraftConverter();

  @override
  DraftModel? fromIsar(String? object) {
    if (object != null && object.isNotEmpty) {
      return DraftModel.fromJson(object);
    }
    return null;
  }

  @override
  String toIsar(DraftModel? object) {
    return object?.toJson() ?? "";
  }
}
