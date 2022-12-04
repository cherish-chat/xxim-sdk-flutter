import 'package:isar/isar.dart';

/// 数据库监听
class IsarListener {
  final Function(Isar isar) onCreate; // 创建

  IsarListener({
    required this.onCreate,
  });

  void create(Isar isar) {
    onCreate(isar);
  }
}
