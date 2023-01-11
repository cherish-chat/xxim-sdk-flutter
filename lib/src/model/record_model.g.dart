// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRecordModelCollection on Isar {
  IsarCollection<RecordModel> get recordModels => getCollection();
}

const RecordModelSchema = CollectionSchema(
  name: 'RecordModel',
  schema:
      '{"name":"RecordModel","idName":"id","properties":[{"name":"convId","type":"String"},{"name":"maxSeq","type":"Long"},{"name":"minSeq","type":"Long"},{"name":"seq","type":"Long"},{"name":"updateTime","type":"Long"}],"indexes":[{"name":"convId","unique":false,"properties":[{"name":"convId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'convId': 0,
    'maxSeq': 1,
    'minSeq': 2,
    'seq': 3,
    'updateTime': 4
  },
  listProperties: {},
  indexIds: {'convId': 0},
  indexValueTypes: {
    'convId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _recordModelGetId,
  setId: _recordModelSetId,
  getLinks: _recordModelGetLinks,
  attachLinks: _recordModelAttachLinks,
  serializeNative: _recordModelSerializeNative,
  deserializeNative: _recordModelDeserializeNative,
  deserializePropNative: _recordModelDeserializePropNative,
  serializeWeb: _recordModelSerializeWeb,
  deserializeWeb: _recordModelDeserializeWeb,
  deserializePropWeb: _recordModelDeserializePropWeb,
  version: 3,
);

int? _recordModelGetId(RecordModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _recordModelSetId(RecordModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _recordModelGetLinks(RecordModel object) {
  return [];
}

void _recordModelSerializeNative(
    IsarCollection<RecordModel> collection,
    IsarRawObject rawObj,
    RecordModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.convId;
  final _convId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_convId.length) as int;
  final value1 = object.maxSeq;
  final _maxSeq = value1;
  final value2 = object.minSeq;
  final _minSeq = value2;
  final value3 = object.seq;
  final _seq = value3;
  final value4 = object.updateTime;
  final _updateTime = value4;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _convId);
  writer.writeLong(offsets[1], _maxSeq);
  writer.writeLong(offsets[2], _minSeq);
  writer.writeLong(offsets[3], _seq);
  writer.writeLong(offsets[4], _updateTime);
}

RecordModel _recordModelDeserializeNative(
    IsarCollection<RecordModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RecordModel(
    convId: reader.readString(offsets[0]),
    maxSeq: reader.readLong(offsets[1]),
    minSeq: reader.readLong(offsets[2]),
    seq: reader.readLong(offsets[3]),
    updateTime: reader.readLong(offsets[4]),
  );
  object.id = id;
  return object;
}

P _recordModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _recordModelSerializeWeb(
    IsarCollection<RecordModel> collection, RecordModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'convId', object.convId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'maxSeq', object.maxSeq);
  IsarNative.jsObjectSet(jsObj, 'minSeq', object.minSeq);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  IsarNative.jsObjectSet(jsObj, 'updateTime', object.updateTime);
  return jsObj;
}

RecordModel _recordModelDeserializeWeb(
    IsarCollection<RecordModel> collection, dynamic jsObj) {
  final object = RecordModel(
    convId: IsarNative.jsObjectGet(jsObj, 'convId') ?? '',
    maxSeq: IsarNative.jsObjectGet(jsObj, 'maxSeq') ?? double.negativeInfinity,
    minSeq: IsarNative.jsObjectGet(jsObj, 'minSeq') ?? double.negativeInfinity,
    seq: IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity,
    updateTime:
        IsarNative.jsObjectGet(jsObj, 'updateTime') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _recordModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'convId':
      return (IsarNative.jsObjectGet(jsObj, 'convId') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'maxSeq':
      return (IsarNative.jsObjectGet(jsObj, 'maxSeq') ??
          double.negativeInfinity) as P;
    case 'minSeq':
      return (IsarNative.jsObjectGet(jsObj, 'minSeq') ??
          double.negativeInfinity) as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity)
          as P;
    case 'updateTime':
      return (IsarNative.jsObjectGet(jsObj, 'updateTime') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _recordModelAttachLinks(IsarCollection col, int id, RecordModel object) {}

extension RecordModelQueryWhereSort
    on QueryBuilder<RecordModel, RecordModel, QWhere> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anyConvId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convId'));
  }
}

extension RecordModelQueryWhere
    on QueryBuilder<RecordModel, RecordModel, QWhereClause> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convId',
      value: [convId],
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIdNotEqualTo(
      String convId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convId',
        upper: [convId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convId',
        lower: [convId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convId',
        lower: [convId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convId',
        upper: [convId],
        includeUpper: false,
      ));
    }
  }
}

extension RecordModelQueryFilter
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {
  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'convId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      maxSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'maxSeq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      minSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'minSeq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'seq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updateTime',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updateTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension RecordModelQueryLinks
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {}

extension RecordModelQueryWhereSortBy
    on QueryBuilder<RecordModel, RecordModel, QSortBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMaxSeq() {
    return addSortByInternal('maxSeq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMaxSeqDesc() {
    return addSortByInternal('maxSeq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMinSeq() {
    return addSortByInternal('minSeq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMinSeqDesc() {
    return addSortByInternal('minSeq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }
}

extension RecordModelQueryWhereSortThenBy
    on QueryBuilder<RecordModel, RecordModel, QSortThenBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMaxSeq() {
    return addSortByInternal('maxSeq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMaxSeqDesc() {
    return addSortByInternal('maxSeq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMinSeq() {
    return addSortByInternal('minSeq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMinSeqDesc() {
    return addSortByInternal('minSeq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByUpdateTime() {
    return addSortByInternal('updateTime', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByUpdateTimeDesc() {
    return addSortByInternal('updateTime', Sort.desc);
  }
}

extension RecordModelQueryWhereDistinct
    on QueryBuilder<RecordModel, RecordModel, QDistinct> {
  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convId', caseSensitive: caseSensitive);
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByMaxSeq() {
    return addDistinctByInternal('maxSeq');
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByMinSeq() {
    return addDistinctByInternal('minSeq');
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByUpdateTime() {
    return addDistinctByInternal('updateTime');
  }
}

extension RecordModelQueryProperty
    on QueryBuilder<RecordModel, RecordModel, QQueryProperty> {
  QueryBuilder<RecordModel, String, QQueryOperations> convIdProperty() {
    return addPropertyNameInternal('convId');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> maxSeqProperty() {
    return addPropertyNameInternal('maxSeq');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> minSeqProperty() {
    return addPropertyNameInternal('minSeq');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> updateTimeProperty() {
    return addPropertyNameInternal('updateTime');
  }
}
