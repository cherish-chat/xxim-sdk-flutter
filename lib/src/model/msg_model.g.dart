// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMsgModelCollection on Isar {
  IsarCollection<MsgModel> get msgModels => getCollection();
}

const MsgModelSchema = CollectionSchema(
  name: 'MsgModel',
  schema:
      '{"name":"MsgModel","idName":"id","properties":[{"name":"atUsers","type":"String"},{"name":"clientMsgId","type":"String"},{"name":"clientTime","type":"Long"},{"name":"content","type":"String"},{"name":"contentType","type":"Long"},{"name":"convId","type":"String"},{"name":"deleted","type":"Bool"},{"name":"ext","type":"String"},{"name":"offlinePush","type":"String"},{"name":"options","type":"String"},{"name":"sendProgress","type":"Long"},{"name":"sendStatus","type":"Long"},{"name":"senderId","type":"String"},{"name":"senderInfo","type":"String"},{"name":"seq","type":"Long"},{"name":"serverMsgId","type":"String"},{"name":"serverTime","type":"Long"}],"indexes":[{"name":"clientMsgId","unique":false,"properties":[{"name":"clientMsgId","type":"Hash","caseSensitive":true}]},{"name":"content","unique":false,"properties":[{"name":"content","type":"Hash","caseSensitive":true}]},{"name":"contentType","unique":false,"properties":[{"name":"contentType","type":"Value","caseSensitive":false}]},{"name":"convId","unique":false,"properties":[{"name":"convId","type":"Hash","caseSensitive":true}]},{"name":"senderId","unique":false,"properties":[{"name":"senderId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'atUsers': 0,
    'clientMsgId': 1,
    'clientTime': 2,
    'content': 3,
    'contentType': 4,
    'convId': 5,
    'deleted': 6,
    'ext': 7,
    'offlinePush': 8,
    'options': 9,
    'sendProgress': 10,
    'sendStatus': 11,
    'senderId': 12,
    'senderInfo': 13,
    'seq': 14,
    'serverMsgId': 15,
    'serverTime': 16
  },
  listProperties: {},
  indexIds: {
    'clientMsgId': 0,
    'content': 1,
    'contentType': 2,
    'convId': 3,
    'senderId': 4
  },
  indexValueTypes: {
    'clientMsgId': [
      IndexValueType.stringHash,
    ],
    'content': [
      IndexValueType.stringHash,
    ],
    'contentType': [
      IndexValueType.long,
    ],
    'convId': [
      IndexValueType.stringHash,
    ],
    'senderId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _msgModelGetId,
  setId: _msgModelSetId,
  getLinks: _msgModelGetLinks,
  attachLinks: _msgModelAttachLinks,
  serializeNative: _msgModelSerializeNative,
  deserializeNative: _msgModelDeserializeNative,
  deserializePropNative: _msgModelDeserializePropNative,
  serializeWeb: _msgModelSerializeWeb,
  deserializeWeb: _msgModelDeserializeWeb,
  deserializePropWeb: _msgModelDeserializePropWeb,
  version: 3,
);

int? _msgModelGetId(MsgModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _msgModelSetId(MsgModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _msgModelGetLinks(MsgModel object) {
  return [];
}

const _msgModelAtUsersConverter = AtUsersConverter();
const _msgModelMsgOfflinePushConverter = MsgOfflinePushConverter();
const _msgModelMsgOptionsConverter = MsgOptionsConverter();

void _msgModelSerializeNative(
    IsarCollection<MsgModel> collection,
    IsarRawObject rawObj,
    MsgModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = _msgModelAtUsersConverter.toIsar(object.atUsers);
  final _atUsers = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_atUsers.length) as int;
  final value1 = object.clientMsgId;
  final _clientMsgId = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_clientMsgId.length) as int;
  final value2 = object.clientTime;
  final _clientTime = value2;
  final value3 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_content.length) as int;
  final value4 = object.contentType;
  final _contentType = value4;
  final value5 = object.convId;
  final _convId = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_convId.length) as int;
  final value6 = object.deleted;
  final _deleted = value6;
  final value7 = object.ext;
  final _ext = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_ext.length) as int;
  final value8 = _msgModelMsgOfflinePushConverter.toIsar(object.offlinePush);
  final _offlinePush = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_offlinePush.length) as int;
  final value9 = _msgModelMsgOptionsConverter.toIsar(object.options);
  final _options = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_options.length) as int;
  final value10 = object.sendProgress;
  final _sendProgress = value10;
  final value11 = object.sendStatus;
  final _sendStatus = value11;
  final value12 = object.senderId;
  final _senderId = IsarBinaryWriter.utf8Encoder.convert(value12);
  dynamicSize += (_senderId.length) as int;
  final value13 = object.senderInfo;
  final _senderInfo = IsarBinaryWriter.utf8Encoder.convert(value13);
  dynamicSize += (_senderInfo.length) as int;
  final value14 = object.seq;
  final _seq = value14;
  final value15 = object.serverMsgId;
  IsarUint8List? _serverMsgId;
  if (value15 != null) {
    _serverMsgId = IsarBinaryWriter.utf8Encoder.convert(value15);
  }
  dynamicSize += (_serverMsgId?.length ?? 0) as int;
  final value16 = object.serverTime;
  final _serverTime = value16;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _atUsers);
  writer.writeBytes(offsets[1], _clientMsgId);
  writer.writeLong(offsets[2], _clientTime);
  writer.writeBytes(offsets[3], _content);
  writer.writeLong(offsets[4], _contentType);
  writer.writeBytes(offsets[5], _convId);
  writer.writeBool(offsets[6], _deleted);
  writer.writeBytes(offsets[7], _ext);
  writer.writeBytes(offsets[8], _offlinePush);
  writer.writeBytes(offsets[9], _options);
  writer.writeLong(offsets[10], _sendProgress);
  writer.writeLong(offsets[11], _sendStatus);
  writer.writeBytes(offsets[12], _senderId);
  writer.writeBytes(offsets[13], _senderInfo);
  writer.writeLong(offsets[14], _seq);
  writer.writeBytes(offsets[15], _serverMsgId);
  writer.writeLong(offsets[16], _serverTime);
}

MsgModel _msgModelDeserializeNative(IsarCollection<MsgModel> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = MsgModel(
    atUsers: _msgModelAtUsersConverter.fromIsar(reader.readString(offsets[0])),
    clientMsgId: reader.readString(offsets[1]),
    clientTime: reader.readLong(offsets[2]),
    content: reader.readString(offsets[3]),
    contentType: reader.readLong(offsets[4]),
    convId: reader.readString(offsets[5]),
    deleted: reader.readBool(offsets[6]),
    ext: reader.readString(offsets[7]),
    offlinePush: _msgModelMsgOfflinePushConverter
        .fromIsar(reader.readString(offsets[8])),
    options:
        _msgModelMsgOptionsConverter.fromIsar(reader.readString(offsets[9])),
    sendProgress: reader.readLong(offsets[10]),
    sendStatus: reader.readLong(offsets[11]),
    senderId: reader.readString(offsets[12]),
    senderInfo: reader.readString(offsets[13]),
    seq: reader.readLong(offsets[14]),
    serverMsgId: reader.readStringOrNull(offsets[15]),
    serverTime: reader.readLong(offsets[16]),
  );
  object.id = id;
  return object;
}

P _msgModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_msgModelAtUsersConverter.fromIsar(reader.readString(offset)))
          as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_msgModelMsgOfflinePushConverter
          .fromIsar(reader.readString(offset))) as P;
    case 9:
      return (_msgModelMsgOptionsConverter.fromIsar(reader.readString(offset)))
          as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _msgModelSerializeWeb(
    IsarCollection<MsgModel> collection, MsgModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'atUsers', _msgModelAtUsersConverter.toIsar(object.atUsers));
  IsarNative.jsObjectSet(jsObj, 'clientMsgId', object.clientMsgId);
  IsarNative.jsObjectSet(jsObj, 'clientTime', object.clientTime);
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(jsObj, 'contentType', object.contentType);
  IsarNative.jsObjectSet(jsObj, 'convId', object.convId);
  IsarNative.jsObjectSet(jsObj, 'deleted', object.deleted);
  IsarNative.jsObjectSet(jsObj, 'ext', object.ext);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'offlinePush',
      _msgModelMsgOfflinePushConverter.toIsar(object.offlinePush));
  IsarNative.jsObjectSet(
      jsObj, 'options', _msgModelMsgOptionsConverter.toIsar(object.options));
  IsarNative.jsObjectSet(jsObj, 'sendProgress', object.sendProgress);
  IsarNative.jsObjectSet(jsObj, 'sendStatus', object.sendStatus);
  IsarNative.jsObjectSet(jsObj, 'senderId', object.senderId);
  IsarNative.jsObjectSet(jsObj, 'senderInfo', object.senderInfo);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  IsarNative.jsObjectSet(jsObj, 'serverMsgId', object.serverMsgId);
  IsarNative.jsObjectSet(jsObj, 'serverTime', object.serverTime);
  return jsObj;
}

MsgModel _msgModelDeserializeWeb(
    IsarCollection<MsgModel> collection, dynamic jsObj) {
  final object = MsgModel(
    atUsers: _msgModelAtUsersConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'atUsers') ?? ''),
    clientMsgId: IsarNative.jsObjectGet(jsObj, 'clientMsgId') ?? '',
    clientTime:
        IsarNative.jsObjectGet(jsObj, 'clientTime') ?? double.negativeInfinity,
    content: IsarNative.jsObjectGet(jsObj, 'content') ?? '',
    contentType:
        IsarNative.jsObjectGet(jsObj, 'contentType') ?? double.negativeInfinity,
    convId: IsarNative.jsObjectGet(jsObj, 'convId') ?? '',
    deleted: IsarNative.jsObjectGet(jsObj, 'deleted') ?? false,
    ext: IsarNative.jsObjectGet(jsObj, 'ext') ?? '',
    offlinePush: _msgModelMsgOfflinePushConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? ''),
    options: _msgModelMsgOptionsConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'options') ?? ''),
    sendProgress: IsarNative.jsObjectGet(jsObj, 'sendProgress') ??
        double.negativeInfinity,
    sendStatus:
        IsarNative.jsObjectGet(jsObj, 'sendStatus') ?? double.negativeInfinity,
    senderId: IsarNative.jsObjectGet(jsObj, 'senderId') ?? '',
    senderInfo: IsarNative.jsObjectGet(jsObj, 'senderInfo') ?? '',
    seq: IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity,
    serverMsgId: IsarNative.jsObjectGet(jsObj, 'serverMsgId'),
    serverTime:
        IsarNative.jsObjectGet(jsObj, 'serverTime') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _msgModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'atUsers':
      return (_msgModelAtUsersConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'atUsers') ?? '')) as P;
    case 'clientMsgId':
      return (IsarNative.jsObjectGet(jsObj, 'clientMsgId') ?? '') as P;
    case 'clientTime':
      return (IsarNative.jsObjectGet(jsObj, 'clientTime') ??
          double.negativeInfinity) as P;
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'contentType':
      return (IsarNative.jsObjectGet(jsObj, 'contentType') ??
          double.negativeInfinity) as P;
    case 'convId':
      return (IsarNative.jsObjectGet(jsObj, 'convId') ?? '') as P;
    case 'deleted':
      return (IsarNative.jsObjectGet(jsObj, 'deleted') ?? false) as P;
    case 'ext':
      return (IsarNative.jsObjectGet(jsObj, 'ext') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'offlinePush':
      return (_msgModelMsgOfflinePushConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? '')) as P;
    case 'options':
      return (_msgModelMsgOptionsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'options') ?? '')) as P;
    case 'sendProgress':
      return (IsarNative.jsObjectGet(jsObj, 'sendProgress') ??
          double.negativeInfinity) as P;
    case 'sendStatus':
      return (IsarNative.jsObjectGet(jsObj, 'sendStatus') ??
          double.negativeInfinity) as P;
    case 'senderId':
      return (IsarNative.jsObjectGet(jsObj, 'senderId') ?? '') as P;
    case 'senderInfo':
      return (IsarNative.jsObjectGet(jsObj, 'senderInfo') ?? '') as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity)
          as P;
    case 'serverMsgId':
      return (IsarNative.jsObjectGet(jsObj, 'serverMsgId')) as P;
    case 'serverTime':
      return (IsarNative.jsObjectGet(jsObj, 'serverTime') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _msgModelAttachLinks(IsarCollection col, int id, MsgModel object) {}

extension MsgModelQueryWhereSort on QueryBuilder<MsgModel, MsgModel, QWhere> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyClientMsgId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'clientMsgId'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyContent() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'content'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyContentType() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'contentType'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyConvId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convId'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anySenderId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'senderId'));
  }
}

extension MsgModelQueryWhere on QueryBuilder<MsgModel, MsgModel, QWhereClause> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIdEqualTo(
      String clientMsgId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'clientMsgId',
      value: [clientMsgId],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIdNotEqualTo(
      String clientMsgId) {
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentEqualTo(
      String content) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'content',
      value: [content],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentNotEqualTo(
      String content) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeEqualTo(
      int contentType) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'contentType',
      value: [contentType],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeNotEqualTo(
      int contentType) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeGreaterThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'contentType',
      lower: [contentType],
      includeLower: include,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeLessThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'contentType',
      upper: [contentType],
      includeUpper: include,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeBetween(
    int lowerContentType,
    int upperContentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'contentType',
      lower: [lowerContentType],
      includeLower: includeLower,
      upper: [upperContentType],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convId',
      value: [convId],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIdNotEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIdEqualTo(
      String senderId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'senderId',
      value: [senderId],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIdNotEqualTo(
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

extension MsgModelQueryFilter
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {
  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersEqualTo(
    List<String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersGreaterThan(
    List<String> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersLessThan(
    List<String> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersBetween(
    List<String> lower,
    List<String> upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'atUsers',
      lower: _msgModelAtUsersConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _msgModelAtUsersConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersStartsWith(
    List<String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersEndsWith(
    List<String> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersContains(
      List<String> value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'atUsers',
      value: _msgModelAtUsersConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'atUsers',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      clientMsgIdGreaterThan(
    String value, {
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdLessThan(
    String value, {
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'clientMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'clientMsgId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'deleted',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ext',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ext',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushEqualTo(
    MsgOfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      offlinePushGreaterThan(
    MsgOfflinePushModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushLessThan(
    MsgOfflinePushModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushBetween(
    MsgOfflinePushModel lower,
    MsgOfflinePushModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'offlinePush',
      lower: _msgModelMsgOfflinePushConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _msgModelMsgOfflinePushConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushStartsWith(
    MsgOfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushEndsWith(
    MsgOfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushContains(
      MsgOfflinePushModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'offlinePush',
      value: _msgModelMsgOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'offlinePush',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsEqualTo(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsGreaterThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsLessThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsBetween(
    MsgOptionsModel lower,
    MsgOptionsModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'options',
      lower: _msgModelMsgOptionsConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _msgModelMsgOptionsConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsStartsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsEndsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsContains(
      MsgOptionsModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'options',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> optionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'options',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendProgress',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      sendProgressGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendProgress',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendProgress',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendProgress',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'senderInfo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderInfo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderInfo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'serverMsgId',
      value: null,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      serverMsgIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverMsgId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'serverMsgId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'serverMsgId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension MsgModelQueryLinks
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {}

extension MsgModelQueryWhereSortBy
    on QueryBuilder<MsgModel, MsgModel, QSortBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByAtUsers() {
    return addSortByInternal('atUsers', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByAtUsersDesc() {
    return addSortByInternal('atUsers', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgId() {
    return addSortByInternal('clientMsgId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgIdDesc() {
    return addSortByInternal('clientMsgId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByExt() {
    return addSortByInternal('ext', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByExtDesc() {
    return addSortByInternal('ext', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOptions() {
    return addSortByInternal('options', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOptionsDesc() {
    return addSortByInternal('options', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendProgress() {
    return addSortByInternal('sendProgress', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendProgressDesc() {
    return addSortByInternal('sendProgress', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderId() {
    return addSortByInternal('senderId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderIdDesc() {
    return addSortByInternal('senderId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderInfo() {
    return addSortByInternal('senderInfo', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderInfoDesc() {
    return addSortByInternal('senderInfo', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgId() {
    return addSortByInternal('serverMsgId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgIdDesc() {
    return addSortByInternal('serverMsgId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MsgModelQueryWhereSortThenBy
    on QueryBuilder<MsgModel, MsgModel, QSortThenBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByAtUsers() {
    return addSortByInternal('atUsers', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByAtUsersDesc() {
    return addSortByInternal('atUsers', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgId() {
    return addSortByInternal('clientMsgId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgIdDesc() {
    return addSortByInternal('clientMsgId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvId() {
    return addSortByInternal('convId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvIdDesc() {
    return addSortByInternal('convId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByDeleted() {
    return addSortByInternal('deleted', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByDeletedDesc() {
    return addSortByInternal('deleted', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByExt() {
    return addSortByInternal('ext', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByExtDesc() {
    return addSortByInternal('ext', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOptions() {
    return addSortByInternal('options', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOptionsDesc() {
    return addSortByInternal('options', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendProgress() {
    return addSortByInternal('sendProgress', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendProgressDesc() {
    return addSortByInternal('sendProgress', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderId() {
    return addSortByInternal('senderId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderIdDesc() {
    return addSortByInternal('senderId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderInfo() {
    return addSortByInternal('senderInfo', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderInfoDesc() {
    return addSortByInternal('senderInfo', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgId() {
    return addSortByInternal('serverMsgId', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgIdDesc() {
    return addSortByInternal('serverMsgId', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MsgModelQueryWhereDistinct
    on QueryBuilder<MsgModel, MsgModel, QDistinct> {
  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByAtUsers(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('atUsers', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientMsgId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('clientMsgId', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientTime() {
    return addDistinctByInternal('clientTime');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContentType() {
    return addDistinctByInternal('contentType');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convId', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByDeleted() {
    return addDistinctByInternal('deleted');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByExt(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('ext', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByOfflinePush(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('offlinePush', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByOptions(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('options', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySendProgress() {
    return addDistinctByInternal('sendProgress');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySendStatus() {
    return addDistinctByInternal('sendStatus');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySenderId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderId', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySenderInfo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderInfo', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerMsgId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('serverMsgId', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerTime() {
    return addDistinctByInternal('serverTime');
  }
}

extension MsgModelQueryProperty
    on QueryBuilder<MsgModel, MsgModel, QQueryProperty> {
  QueryBuilder<MsgModel, List<String>, QQueryOperations> atUsersProperty() {
    return addPropertyNameInternal('atUsers');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> clientMsgIdProperty() {
    return addPropertyNameInternal('clientMsgId');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> clientTimeProperty() {
    return addPropertyNameInternal('clientTime');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> contentTypeProperty() {
    return addPropertyNameInternal('contentType');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> convIdProperty() {
    return addPropertyNameInternal('convId');
  }

  QueryBuilder<MsgModel, bool, QQueryOperations> deletedProperty() {
    return addPropertyNameInternal('deleted');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> extProperty() {
    return addPropertyNameInternal('ext');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<MsgModel, MsgOfflinePushModel, QQueryOperations>
      offlinePushProperty() {
    return addPropertyNameInternal('offlinePush');
  }

  QueryBuilder<MsgModel, MsgOptionsModel, QQueryOperations> optionsProperty() {
    return addPropertyNameInternal('options');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> sendProgressProperty() {
    return addPropertyNameInternal('sendProgress');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> sendStatusProperty() {
    return addPropertyNameInternal('sendStatus');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> senderIdProperty() {
    return addPropertyNameInternal('senderId');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> senderInfoProperty() {
    return addPropertyNameInternal('senderInfo');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }

  QueryBuilder<MsgModel, String?, QQueryOperations> serverMsgIdProperty() {
    return addPropertyNameInternal('serverMsgId');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> serverTimeProperty() {
    return addPropertyNameInternal('serverTime');
  }
}
