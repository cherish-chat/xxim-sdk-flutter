// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetReadModelCollection on Isar {
  IsarCollection<ReadModel> get readModels => getCollection();
}

const ReadModelSchema = CollectionSchema(
  name: 'ReadModel',
  schema:
      '{"name":"ReadModel","idName":"id","properties":[{"name":"convId","type":"String"},{"name":"senderId","type":"String"},{"name":"seq","type":"Long"}],"indexes":[{"name":"convId","unique":false,"properties":[{"name":"convId","type":"Hash","caseSensitive":true}]},{"name":"senderId","unique":false,"properties":[{"name":"senderId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'convId': 0, 'senderId': 1, 'seq': 2},
  listProperties: {},
  indexIds: {'convId': 0, 'senderId': 1},
  indexValueTypes: {
    'convId': [
      IndexValueType.stringHash,
    ],
    'senderId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _readModelGetId,
  setId: _readModelSetId,
  getLinks: _readModelGetLinks,
  attachLinks: _readModelAttachLinks,
  serializeNative: _readModelSerializeNative,
  deserializeNative: _readModelDeserializeNative,
  deserializePropNative: _readModelDeserializePropNative,
  serializeWeb: _readModelSerializeWeb,
  deserializeWeb: _readModelDeserializeWeb,
  deserializePropWeb: _readModelDeserializePropWeb,
  version: 3,
);

int? _readModelGetId(ReadModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _readModelSetId(ReadModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _readModelGetLinks(ReadModel object) {
  return [];
}

void _readModelSerializeNative(
    IsarCollection<ReadModel> collection,
    IsarRawObject rawObj,
    ReadModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.convId;
  final _convId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_convId.length) as int;
  final value1 = object.senderId;
  final _senderId = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_senderId.length) as int;
  final value2 = object.seq;
  final _seq = value2;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _convId);
  writer.writeBytes(offsets[1], _senderId);
  writer.writeLong(offsets[2], _seq);
}

ReadModel _readModelDeserializeNative(IsarCollection<ReadModel> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = ReadModel(
    convId: reader.readString(offsets[0]),
    senderId: reader.readString(offsets[1]),
    seq: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _readModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _readModelSerializeWeb(
    IsarCollection<ReadModel> collection, ReadModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'convId', object.convId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'senderId', object.senderId);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  return jsObj;
}

ReadModel _readModelDeserializeWeb(
    IsarCollection<ReadModel> collection, dynamic jsObj) {
  final object = ReadModel(
    convId: IsarNative.jsObjectGet(jsObj, 'convId') ?? '',
    senderId: IsarNative.jsObjectGet(jsObj, 'senderId') ?? '',
    seq: IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _readModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'convId':
      return (IsarNative.jsObjectGet(jsObj, 'convId') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'senderId':
      return (IsarNative.jsObjectGet(jsObj, 'senderId') ?? '') as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _readModelAttachLinks(IsarCollection col, int id, ReadModel object) {}

extension ReadModelQueryWhereSort
    on QueryBuilder<ReadModel, ReadModel, QWhere> {
  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anyConvId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convId'));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anySenderId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'senderId'));
  }
}

extension ReadModelQueryWhere
    on QueryBuilder<ReadModel, ReadModel, QWhereClause> {
  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convId',
      value: [convId],
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> convIdNotEqualTo(
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> senderIdEqualTo(
      String senderId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'senderId',
      value: [senderId],
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> senderIdNotEqualTo(
      String senderId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'senderId',
        upper: [senderId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'senderId',
        lower: [senderId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'senderId',
        lower: [senderId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'senderId',
        upper: [senderId],
        includeUpper: false,
      ));
    }
  }
}

extension ReadModelQueryFilter
    on QueryBuilder<ReadModel, ReadModel, QFilterCondition> {
  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdStartsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'senderId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqBetween(
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
}

extension ReadModelQueryLinks
    on QueryBuilder<ReadModel, ReadModel, QFilterCondition> {}

extension ReadModelQueryWhereSortBy
    on QueryBuilder<ReadModel, ReadModel, QSortBy> {
  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySenderId() {
    return addSortByInternal('senderId', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySenderIdDesc() {
    return addSortByInternal('senderId', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension ReadModelQueryWhereSortThenBy
    on QueryBuilder<ReadModel, ReadModel, QSortThenBy> {
  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySenderId() {
    return addSortByInternal('senderId', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySenderIdDesc() {
    return addSortByInternal('senderId', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension ReadModelQueryWhereDistinct
    on QueryBuilder<ReadModel, ReadModel, QDistinct> {
  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctBySenderId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }
}

extension ReadModelQueryProperty
    on QueryBuilder<ReadModel, ReadModel, QQueryProperty> {
  QueryBuilder<ReadModel, String, QQueryOperations> convIdProperty() {
    return addPropertyNameInternal('convId');
  }

  QueryBuilder<ReadModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ReadModel, String, QQueryOperations> senderIdProperty() {
    return addPropertyNameInternal('senderId');
  }

  QueryBuilder<ReadModel, int, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }
}
