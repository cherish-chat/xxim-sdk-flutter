// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conv_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetConvModelCollection on Isar {
  IsarCollection<ConvModel> get convModels => getCollection();
}

const ConvModelSchema = CollectionSchema(
  name: 'ConvModel',
  schema:
      '{"name":"ConvModel","idName":"id","properties":[{"name":"clientMsgId","type":"String"},{"name":"convId","type":"String"},{"name":"convType","type":"Long"},{"name":"deleted","type":"Bool"},{"name":"draftModel","type":"String"},{"name":"hidden","type":"Bool"},{"name":"noticeId","type":"String"},{"name":"time","type":"Long"},{"name":"unreadCount","type":"Long"}],"indexes":[{"name":"clientMsgId","unique":false,"properties":[{"name":"clientMsgId","type":"Hash","caseSensitive":true}]},{"name":"convId","unique":false,"properties":[{"name":"convId","type":"Hash","caseSensitive":true}]},{"name":"convType","unique":false,"properties":[{"name":"convType","type":"Value","caseSensitive":false}]},{"name":"noticeId","unique":false,"properties":[{"name":"noticeId","type":"Hash","caseSensitive":true}]},{"name":"unreadCount","unique":false,"properties":[{"name":"unreadCount","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'clientMsgId': 0,
    'convId': 1,
    'convType': 2,
    'deleted': 3,
    'draftModel': 4,
    'hidden': 5,
    'noticeId': 6,
    'time': 7,
    'unreadCount': 8
  },
  listProperties: {},
  indexIds: {
    'clientMsgId': 0,
    'convId': 1,
    'convType': 2,
    'noticeId': 3,
    'unreadCount': 4
  },
  indexValueTypes: {
    'clientMsgId': [
      IndexValueType.stringHash,
    ],
    'convId': [
      IndexValueType.stringHash,
    ],
    'convType': [
      IndexValueType.long,
    ],
    'noticeId': [
      IndexValueType.stringHash,
    ],
    'unreadCount': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _convModelGetId,
  setId: _convModelSetId,
  getLinks: _convModelGetLinks,
  attachLinks: _convModelAttachLinks,
  serializeNative: _convModelSerializeNative,
  deserializeNative: _convModelDeserializeNative,
  deserializePropNative: _convModelDeserializePropNative,
  serializeWeb: _convModelSerializeWeb,
  deserializeWeb: _convModelDeserializeWeb,
  deserializePropWeb: _convModelDeserializePropWeb,
  version: 3,
);

int? _convModelGetId(ConvModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _convModelSetId(ConvModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _convModelGetLinks(ConvModel object) {
  return [];
}

const _convModelDraftConverter = DraftConverter();

void _convModelSerializeNative(
    IsarCollection<ConvModel> collection,
    IsarRawObject rawObj,
    ConvModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.clientMsgId;
  IsarUint8List? _clientMsgId;
  if (value0 != null) {
    _clientMsgId = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_clientMsgId?.length ?? 0) as int;
  final value1 = object.convId;
  final _convId = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_convId.length) as int;
  final value2 = object.convType;
  final _convType = value2;
  final value3 = object.deleted;
  final _deleted = value3;
  final value4 = _convModelDraftConverter.toIsar(object.draftModel);
  final _draftModel = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_draftModel.length) as int;
  final value5 = object.hidden;
  final _hidden = value5;
  final value6 = object.noticeId;
  IsarUint8List? _noticeId;
  if (value6 != null) {
    _noticeId = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_noticeId?.length ?? 0) as int;
  final value7 = object.time;
  final _time = value7;
  final value8 = object.unreadCount;
  final _unreadCount = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _clientMsgId);
  writer.writeBytes(offsets[1], _convId);
  writer.writeLong(offsets[2], _convType);
  writer.writeBool(offsets[3], _deleted);
  writer.writeBytes(offsets[4], _draftModel);
  writer.writeBool(offsets[5], _hidden);
  writer.writeBytes(offsets[6], _noticeId);
  writer.writeLong(offsets[7], _time);
  writer.writeLong(offsets[8], _unreadCount);
}

ConvModel _convModelDeserializeNative(IsarCollection<ConvModel> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = ConvModel(
    clientMsgId: reader.readStringOrNull(offsets[0]),
    convId: reader.readString(offsets[1]),
    convType: reader.readLong(offsets[2]),
    deleted: reader.readBool(offsets[3]),
    draftModel:
        _convModelDraftConverter.fromIsar(reader.readString(offsets[4])),
    hidden: reader.readBool(offsets[5]),
    noticeId: reader.readStringOrNull(offsets[6]),
    time: reader.readLong(offsets[7]),
    unreadCount: reader.readLong(offsets[8]),
  );
  object.id = id;
  return object;
}

P _convModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_convModelDraftConverter.fromIsar(reader.readString(offset)))
          as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _convModelSerializeWeb(
    IsarCollection<ConvModel> collection, ConvModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'clientMsgId', object.clientMsgId);
  IsarNative.jsObjectSet(jsObj, 'convId', object.convId);
  IsarNative.jsObjectSet(jsObj, 'convType', object.convType);
  IsarNative.jsObjectSet(jsObj, 'deleted', object.deleted);
  IsarNative.jsObjectSet(
      jsObj, 'draftModel', _convModelDraftConverter.toIsar(object.draftModel));
  IsarNative.jsObjectSet(jsObj, 'hidden', object.hidden);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'noticeId', object.noticeId);
  IsarNative.jsObjectSet(jsObj, 'time', object.time);
  IsarNative.jsObjectSet(jsObj, 'unreadCount', object.unreadCount);
  return jsObj;
}

ConvModel _convModelDeserializeWeb(
    IsarCollection<ConvModel> collection, dynamic jsObj) {
  final object = ConvModel(
    clientMsgId: IsarNative.jsObjectGet(jsObj, 'clientMsgId'),
    convId: IsarNative.jsObjectGet(jsObj, 'convId') ?? '',
    convType:
        IsarNative.jsObjectGet(jsObj, 'convType') ?? double.negativeInfinity,
    deleted: IsarNative.jsObjectGet(jsObj, 'deleted') ?? false,
    draftModel: _convModelDraftConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftModel') ?? ''),
    hidden: IsarNative.jsObjectGet(jsObj, 'hidden') ?? false,
    noticeId: IsarNative.jsObjectGet(jsObj, 'noticeId'),
    time: IsarNative.jsObjectGet(jsObj, 'time') ?? double.negativeInfinity,
    unreadCount:
        IsarNative.jsObjectGet(jsObj, 'unreadCount') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _convModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'clientMsgId':
      return (IsarNative.jsObjectGet(jsObj, 'clientMsgId')) as P;
    case 'convId':
      return (IsarNative.jsObjectGet(jsObj, 'convId') ?? '') as P;
    case 'convType':
      return (IsarNative.jsObjectGet(jsObj, 'convType') ??
          double.negativeInfinity) as P;
    case 'deleted':
      return (IsarNative.jsObjectGet(jsObj, 'deleted') ?? false) as P;
    case 'draftModel':
      return (_convModelDraftConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftModel') ?? '')) as P;
    case 'hidden':
      return (IsarNative.jsObjectGet(jsObj, 'hidden') ?? false) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'noticeId':
      return (IsarNative.jsObjectGet(jsObj, 'noticeId')) as P;
    case 'time':
      return (IsarNative.jsObjectGet(jsObj, 'time') ?? double.negativeInfinity)
          as P;
    case 'unreadCount':
      return (IsarNative.jsObjectGet(jsObj, 'unreadCount') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _convModelAttachLinks(IsarCollection col, int id, ConvModel object) {}

extension ConvModelQueryWhereSort
    on QueryBuilder<ConvModel, ConvModel, QWhere> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyClientMsgId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'clientMsgId'));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyConvId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convId'));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyConvType() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convType'));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyNoticeId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'noticeId'));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyUnreadCount() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'unreadCount'));
  }
}

extension ConvModelQueryWhere
    on QueryBuilder<ConvModel, ConvModel, QWhereClause> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdEqualTo(
      String? clientMsgId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'clientMsgId',
      value: [clientMsgId],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdNotEqualTo(
      String? clientMsgId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgId',
        upper: [clientMsgId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgId',
        lower: [clientMsgId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgId',
        lower: [clientMsgId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgId',
        upper: [clientMsgId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'clientMsgId',
      value: [null],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'clientMsgId',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convId',
      value: [convId],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIdNotEqualTo(
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeEqualTo(
      int convType) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convType',
      value: [convType],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeNotEqualTo(
      int convType) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convType',
        upper: [convType],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convType',
        lower: [convType],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convType',
        lower: [convType],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convType',
        upper: [convType],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeGreaterThan(
    int convType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'convType',
      lower: [convType],
      includeLower: include,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeLessThan(
    int convType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'convType',
      upper: [convType],
      includeUpper: include,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeBetween(
    int lowerConvType,
    int upperConvType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'convType',
      lower: [lowerConvType],
      includeLower: includeLower,
      upper: [upperConvType],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdEqualTo(
      String? noticeId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'noticeId',
      value: [noticeId],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdNotEqualTo(
      String? noticeId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'noticeId',
        upper: [noticeId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'noticeId',
        lower: [noticeId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'noticeId',
        lower: [noticeId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'noticeId',
        upper: [noticeId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'noticeId',
      value: [null],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'noticeId',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountEqualTo(
      int unreadCount) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'unreadCount',
      value: [unreadCount],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountNotEqualTo(
      int unreadCount) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'unreadCount',
        upper: [unreadCount],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'unreadCount',
        lower: [unreadCount],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'unreadCount',
        lower: [unreadCount],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'unreadCount',
        upper: [unreadCount],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountGreaterThan(
    int unreadCount, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'unreadCount',
      lower: [unreadCount],
      includeLower: include,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountLessThan(
    int unreadCount, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'unreadCount',
      upper: [unreadCount],
      includeUpper: include,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountBetween(
    int lowerUnreadCount,
    int upperUnreadCount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'unreadCount',
      lower: [lowerUnreadCount],
      includeLower: includeLower,
      upper: [upperUnreadCount],
      includeUpper: includeUpper,
    ));
  }
}

extension ConvModelQueryFilter
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {
  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'clientMsgId',
      value: null,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientMsgId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'clientMsgId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdStartsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'convType',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'convType',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'convType',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'convType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleted',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelEqualTo(
    DraftModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      draftModelGreaterThan(
    DraftModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelLessThan(
    DraftModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelBetween(
    DraftModel? lower,
    DraftModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'draftModel',
      lower: _convModelDraftConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _convModelDraftConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      draftModelStartsWith(
    DraftModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelEndsWith(
    DraftModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelContains(
      DraftModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'draftModel',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> hiddenEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hidden',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'noticeId',
      value: null,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'noticeId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'noticeId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      unreadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'unreadCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ConvModelQueryLinks
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {}

extension ConvModelQueryWhereSortBy
    on QueryBuilder<ConvModel, ConvModel, QSortBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByClientMsgId() {
    return addSortByInternal('clientMsgId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByClientMsgIdDesc() {
    return addSortByInternal('clientMsgId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvType() {
    return addSortByInternal('convType', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvTypeDesc() {
    return addSortByInternal('convType', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDraftModel() {
    return addSortByInternal('draftModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDraftModelDesc() {
    return addSortByInternal('draftModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByHidden() {
    return addSortByInternal('hidden', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByHiddenDesc() {
    return addSortByInternal('hidden', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByNoticeId() {
    return addSortByInternal('noticeId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByNoticeIdDesc() {
    return addSortByInternal('noticeId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConvModelQueryWhereSortThenBy
    on QueryBuilder<ConvModel, ConvModel, QSortThenBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByClientMsgId() {
    return addSortByInternal('clientMsgId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByClientMsgIdDesc() {
    return addSortByInternal('clientMsgId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvType() {
    return addSortByInternal('convType', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvTypeDesc() {
    return addSortByInternal('convType', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDraftModel() {
    return addSortByInternal('draftModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDraftModelDesc() {
    return addSortByInternal('draftModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByHidden() {
    return addSortByInternal('hidden', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByHiddenDesc() {
    return addSortByInternal('hidden', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByNoticeId() {
    return addSortByInternal('noticeId', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByNoticeIdDesc() {
    return addSortByInternal('noticeId', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConvModelQueryWhereDistinct
    on QueryBuilder<ConvModel, ConvModel, QDistinct> {
  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByClientMsgId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('clientMsgId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByConvType() {
    return addDistinctByInternal('convType');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByDeleted() {
    return addDistinctByInternal('deleted');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByDraftModel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('draftModel', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByHidden() {
    return addDistinctByInternal('hidden');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByNoticeId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('noticeId', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByTime() {
    return addDistinctByInternal('time');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByUnreadCount() {
    return addDistinctByInternal('unreadCount');
  }
}

extension ConvModelQueryProperty
    on QueryBuilder<ConvModel, ConvModel, QQueryProperty> {
  QueryBuilder<ConvModel, String?, QQueryOperations> clientMsgIdProperty() {
    return addPropertyNameInternal('clientMsgId');
  }

  QueryBuilder<ConvModel, String, QQueryOperations> convIdProperty() {
    return addPropertyNameInternal('convId');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> convTypeProperty() {
    return addPropertyNameInternal('convType');
  }

  QueryBuilder<ConvModel, bool, QQueryOperations> deletedProperty() {
    return addPropertyNameInternal('deleted');
  }

  QueryBuilder<ConvModel, DraftModel?, QQueryOperations> draftModelProperty() {
    return addPropertyNameInternal('draftModel');
  }

  QueryBuilder<ConvModel, bool, QQueryOperations> hiddenProperty() {
    return addPropertyNameInternal('hidden');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ConvModel, String?, QQueryOperations> noticeIdProperty() {
    return addPropertyNameInternal('noticeId');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> unreadCountProperty() {
    return addPropertyNameInternal('unreadCount');
  }
}
