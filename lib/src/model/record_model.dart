import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';

part 'record_model.g.dart';

@Collection()
class RecordModel {
  int id = Isar.autoIncrement;

  @Index()
  String convId;
  int minSeq;
  int maxSeq;
  int updateTime;
  int seq;

  RecordModel({
    required this.convId,
    required this.minSeq,
    required this.maxSeq,
    required this.updateTime,
    this.seq = 0,
  });

  static RecordModel fromProto(BatchGetConvSeqResp_ConvSeq convSeq) {
    return RecordModel(
      convId: convSeq.convId,
      minSeq: int.parse(convSeq.minSeq),
      maxSeq: int.parse(convSeq.maxSeq),
      updateTime: int.parse(convSeq.updateTime),
    );
  }
}
