// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetNoticeModelCollection on Isar {
  IsarCollection<NoticeModel> get noticeModels => getCollection();
}

const NoticeModelSchema = CollectionSchema(
  name: 'NoticeModel',
  schema:
      '{"name":"NoticeModel","idName":"id","properties":[{"name":"content","type":"String"},{"name":"contentType","type":"Long"},{"name":"convId","type":"String"},{"name":"createTime","type":"Long"},{"name":"deleted","type":"Bool"},{"name":"ext","type":"String"},{"name":"noticeId","type":"String"},{"name":"options","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"convId","unique":false,"properties":[{"name":"convId","type":"Hash","caseSensitive":true}]},{"name":"noticeId","unique":false,"properties":[{"name":"noticeId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'content': 0,
    'contentType': 1,
    'convId': 2,
    'createTime': 3,
    'deleted': 4,
    'ext': 5,
    'noticeId': 6,
    'options': 7,
    'title': 8
  },
  listProperties: {},
  indexIds: {'convId': 0, 'noticeId': 1},
  indexValueTypes: {
    'convId': [
      IndexValueType.stringHash,
    ],
    'noticeId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _noticeModelGetId,
  setId: _noticeModelSetId,
  getLinks: _noticeModelGetLinks,
  attachLinks: _noticeModelAttachLinks,
  serializeNative: _noticeModelSerializeNative,
  deserializeNative: _noticeModelDeserializeNative,
  deserializePropNative: _noticeModelDeserializePropNative,
  serializeWeb: _noticeModelSerializeWeb,
  deserializeWeb: _noticeModelDeserializeWeb,
  deserializePropWeb: _noticeModelDeserializePropWeb,
  version: 3,
);

int? _noticeModelGetId(NoticeModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _noticeModelSetId(NoticeModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _noticeModelGetLinks(NoticeModel object) {
  return [];
}

const _noticeModelNoticeOptionsConverter = NoticeOptionsConverter();

void _noticeModelSerializeNative(
    IsarCollection<NoticeModel> collection,
    IsarRawObject rawObj,
    NoticeModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_content.length) as int;
  final value1 = object.contentType;
  final _contentType = value1;
  final value2 = object.convId;
  final _convId = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_convId.length) as int;
  final value3 = object.createTime;
  final _createTime = value3;
  final value4 = object.deleted;
  final _deleted = value4;
  final value5 = object.ext;
  final _ext = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_ext.length) as int;
  final value6 = object.noticeId;
  final _noticeId = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_noticeId.length) as int;
  final value7 = _noticeModelNoticeOptionsConverter.toIsar(object.options);
  final _options = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_options.length) as int;
  final value8 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _content);
  writer.writeLong(offsets[1], _contentType);
  writer.writeBytes(offsets[2], _convId);
  writer.writeLong(offsets[3], _createTime);
  writer.writeBool(offsets[4], _deleted);
  writer.writeBytes(offsets[5], _ext);
  writer.writeBytes(offsets[6], _noticeId);
  writer.writeBytes(offsets[7], _options);
  writer.writeBytes(offsets[8], _title);
}

NoticeModel _noticeModelDeserializeNative(
    IsarCollection<NoticeModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = NoticeModel(
    content: reader.readString(offsets[0]),
    contentType: reader.readLong(offsets[1]),
    convId: reader.readString(offsets[2]),
    createTime: reader.readLong(offsets[3]),
    deleted: reader.readBool(offsets[4]),
    ext: reader.readString(offsets[5]),
    noticeId: reader.readString(offsets[6]),
    options: _noticeModelNoticeOptionsConverter
        .fromIsar(reader.readString(offsets[7])),
    title: reader.readString(offsets[8]),
  );
  object.id = id;
  return object;
}

P _noticeModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_noticeModelNoticeOptionsConverter
          .fromIsar(reader.readString(offset))) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _noticeModelSerializeWeb(
    IsarCollection<NoticeModel> collection, NoticeModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(jsObj, 'contentType', object.contentType);
  IsarNative.jsObjectSet(jsObj, 'convId', object.convId);
  IsarNative.jsObjectSet(jsObj, 'createTime', object.createTime);
  IsarNative.jsObjectSet(jsObj, 'deleted', object.deleted);
  IsarNative.jsObjectSet(jsObj, 'ext', object.ext);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'noticeId', object.noticeId);
  IsarNative.jsObjectSet(jsObj, 'options',
      _noticeModelNoticeOptionsConverter.toIsar(object.options));
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

NoticeModel _noticeModelDeserializeWeb(
    IsarCollection<NoticeModel> collection, dynamic jsObj) {
  final object = NoticeModel(
    content: IsarNative.jsObjectGet(jsObj, 'content') ?? '',
    contentType:
        IsarNative.jsObjectGet(jsObj, 'contentType') ?? double.negativeInfinity,
    convId: IsarNative.jsObjectGet(jsObj, 'convId') ?? '',
    createTime:
        IsarNative.jsObjectGet(jsObj, 'createTime') ?? double.negativeInfinity,
    deleted: IsarNative.jsObjectGet(jsObj, 'deleted') ?? false,
    ext: IsarNative.jsObjectGet(jsObj, 'ext') ?? '',
    noticeId: IsarNative.jsObjectGet(jsObj, 'noticeId') ?? '',
    options: _noticeModelNoticeOptionsConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'options') ?? ''),
    title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _noticeModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'contentType':
      return (IsarNative.jsObjectGet(jsObj, 'contentType') ??
          double.negativeInfinity) as P;
    case 'convId':
      return (IsarNative.jsObjectGet(jsObj, 'convId') ?? '') as P;
    case 'createTime':
      return (IsarNative.jsObjectGet(jsObj, 'createTime') ??
          double.negativeInfinity) as P;
    case 'deleted':
      return (IsarNative.jsObjectGet(jsObj, 'deleted') ?? false) as P;
    case 'ext':
      return (IsarNative.jsObjectGet(jsObj, 'ext') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'noticeId':
      return (IsarNative.jsObjectGet(jsObj, 'noticeId') ?? '') as P;
    case 'options':
      return (_noticeModelNoticeOptionsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'options') ?? '')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _noticeModelAttachLinks(IsarCollection col, int id, NoticeModel object) {}

extension NoticeModelQueryWhereSort
    on QueryBuilder<NoticeModel, NoticeModel, QWhere> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhere> anyConvId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convId'));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhere> anyNoticeId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'noticeId'));
  }
}

extension NoticeModelQueryWhere
    on QueryBuilder<NoticeModel, NoticeModel, QWhereClause> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convId',
      value: [convId],
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> convIdNotEqualTo(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> noticeIdEqualTo(
      String noticeId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'noticeId',
      value: [noticeId],
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> noticeIdNotEqualTo(
      String noticeId) {
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
}

extension NoticeModelQueryFilter
    on QueryBuilder<NoticeModel, NoticeModel, QFilterCondition> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'content',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentTypeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      contentTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'contentType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      createTimeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createTime',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      createTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createTime',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      createTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createTime',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      createTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleted',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'ext',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> extMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ext',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> noticeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      noticeIdGreaterThan(
    String value, {
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      noticeIdLessThan(
    String value, {
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> noticeIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      noticeIdStartsWith(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      noticeIdEndsWith(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      noticeIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'noticeId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> noticeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'noticeId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsEqualTo(
    NoticeOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      optionsGreaterThan(
    NoticeOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsLessThan(
    NoticeOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsBetween(
    NoticeOptionsModel lower,
    NoticeOptionsModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'options',
      lower: _noticeModelNoticeOptionsConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _noticeModelNoticeOptionsConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      optionsStartsWith(
    NoticeOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsEndsWith(
    NoticeOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsContains(
      NoticeOptionsModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'options',
      value: _noticeModelNoticeOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> optionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'options',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension NoticeModelQueryLinks
    on QueryBuilder<NoticeModel, NoticeModel, QFilterCondition> {}

extension NoticeModelQueryWhereSortBy
    on QueryBuilder<NoticeModel, NoticeModel, QSortBy> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByCreateTime() {
    return addSortByInternal('createTime', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByCreateTimeDesc() {
    return addSortByInternal('createTime', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByExt() {
    return addSortByInternal('ext', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByExtDesc() {
    return addSortByInternal('ext', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByNoticeId() {
    return addSortByInternal('noticeId', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByNoticeIdDesc() {
    return addSortByInternal('noticeId', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByOptions() {
    return addSortByInternal('options', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByOptionsDesc() {
    return addSortByInternal('options', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension NoticeModelQueryWhereSortThenBy
    on QueryBuilder<NoticeModel, NoticeModel, QSortThenBy> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByCreateTime() {
    return addSortByInternal('createTime', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByCreateTimeDesc() {
    return addSortByInternal('createTime', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByExt() {
    return addSortByInternal('ext', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByExtDesc() {
    return addSortByInternal('ext', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByNoticeId() {
    return addSortByInternal('noticeId', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByNoticeIdDesc() {
    return addSortByInternal('noticeId', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByOptions() {
    return addSortByInternal('options', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByOptionsDesc() {
    return addSortByInternal('options', Sort.desc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension NoticeModelQueryWhereDistinct
    on QueryBuilder<NoticeModel, NoticeModel, QDistinct> {
  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByContentType() {
    return addDistinctByInternal('contentType');
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convId', caseSensitive: caseSensitive);
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByCreateTime() {
    return addDistinctByInternal('createTime');
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByDeleted() {
    return addDistinctByInternal('deleted');
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByExt(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('ext', caseSensitive: caseSensitive);
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByNoticeId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('noticeId', caseSensitive: caseSensitive);
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByOptions(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('options', caseSensitive: caseSensitive);
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension NoticeModelQueryProperty
    on QueryBuilder<NoticeModel, NoticeModel, QQueryProperty> {
  QueryBuilder<NoticeModel, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<NoticeModel, int, QQueryOperations> contentTypeProperty() {
    return addPropertyNameInternal('contentType');
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> convIdProperty() {
    return addPropertyNameInternal('convId');
  }

  QueryBuilder<NoticeModel, int, QQueryOperations> createTimeProperty() {
    return addPropertyNameInternal('createTime');
  }

  QueryBuilder<NoticeModel, bool, QQueryOperations> deletedProperty() {
    return addPropertyNameInternal('deleted');
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> extProperty() {
    return addPropertyNameInternal('ext');
  }

  QueryBuilder<NoticeModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> noticeIdProperty() {
    return addPropertyNameInternal('noticeId');
  }

  QueryBuilder<NoticeModel, NoticeOptionsModel, QQueryOperations>
      optionsProperty() {
    return addPropertyNameInternal('options');
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
