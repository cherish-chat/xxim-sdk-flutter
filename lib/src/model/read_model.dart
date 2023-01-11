import 'package:isar/isar.dart';

part 'read_model.g.dart';

@Collection()
class ReadModel {
  int id = Isar.autoIncrement;

  @Index()
  String senderId;
  @Index()
  String convId;
  int seq;

  ReadModel({
    required this.senderId,
    required this.convId,
    required this.seq,
  });
}
