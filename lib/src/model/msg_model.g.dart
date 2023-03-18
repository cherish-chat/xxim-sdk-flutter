// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMsgModelCollection on Isar {
  IsarCollection<MsgModel> get msgModels => this.collection();
}

const MsgModelSchema = CollectionSchema(
  name: r'MsgModel',
  id: -3450809804253682902,
  properties: {
    r'atUsers': PropertySchema(
      id: 0,
      name: r'atUsers',
      type: IsarType.stringList,
    ),
    r'clientMsgId': PropertySchema(
      id: 1,
      name: r'clientMsgId',
      type: IsarType.string,
    ),
    r'clientTime': PropertySchema(
      id: 2,
      name: r'clientTime',
      type: IsarType.long,
    ),
    r'content': PropertySchema(
      id: 3,
      name: r'content',
      type: IsarType.string,
    ),
    r'contentType': PropertySchema(
      id: 4,
      name: r'contentType',
      type: IsarType.long,
    ),
    r'convId': PropertySchema(
      id: 5,
      name: r'convId',
      type: IsarType.string,
    ),
    r'deleted': PropertySchema(
      id: 6,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'ext': PropertySchema(
      id: 7,
      name: r'ext',
      type: IsarType.string,
    ),
    r'offlinePush': PropertySchema(
      id: 8,
      name: r'offlinePush',
      type: IsarType.object,
      target: r'MsgOfflinePushModel',
    ),
    r'options': PropertySchema(
      id: 9,
      name: r'options',
      type: IsarType.object,
      target: r'MsgOptionsModel',
    ),
    r'sendProgress': PropertySchema(
      id: 10,
      name: r'sendProgress',
      type: IsarType.long,
    ),
    r'sendStatus': PropertySchema(
      id: 11,
      name: r'sendStatus',
      type: IsarType.long,
    ),
    r'senderId': PropertySchema(
      id: 12,
      name: r'senderId',
      type: IsarType.string,
    ),
    r'senderInfo': PropertySchema(
      id: 13,
      name: r'senderInfo',
      type: IsarType.string,
    ),
    r'seq': PropertySchema(
      id: 14,
      name: r'seq',
      type: IsarType.long,
    ),
    r'serverMsgId': PropertySchema(
      id: 15,
      name: r'serverMsgId',
      type: IsarType.string,
    ),
    r'serverTime': PropertySchema(
      id: 16,
      name: r'serverTime',
      type: IsarType.long,
    )
  },
  estimateSize: _msgModelEstimateSize,
  serialize: _msgModelSerialize,
  deserialize: _msgModelDeserialize,
  deserializeProp: _msgModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'clientMsgId': IndexSchema(
      id: 4995524746589355915,
      name: r'clientMsgId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clientMsgId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'senderId': IndexSchema(
      id: -1619654757968658561,
      name: r'senderId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'senderId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'convId': IndexSchema(
      id: -7030550945641449152,
      name: r'convId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'convId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'contentType': IndexSchema(
      id: -4813096802902836239,
      name: r'contentType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'contentType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'content': IndexSchema(
      id: 6193209363630369380,
      name: r'content',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'content',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'MsgOptionsModel': MsgOptionsModelSchema,
    r'MsgOfflinePushModel': MsgOfflinePushModelSchema
  },
  getId: _msgModelGetId,
  getLinks: _msgModelGetLinks,
  attach: _msgModelAttach,
  version: '3.0.2',
);

int _msgModelEstimateSize(
  MsgModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.atUsers.length * 3;
  {
    for (var i = 0; i < object.atUsers.length; i++) {
      final value = object.atUsers[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.clientMsgId.length * 3;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.convId.length * 3;
  bytesCount += 3 + object.ext.length * 3;
  bytesCount += 3 +
      MsgOfflinePushModelSchema.estimateSize(
          object.offlinePush, allOffsets[MsgOfflinePushModel]!, allOffsets);
  bytesCount += 3 +
      MsgOptionsModelSchema.estimateSize(
          object.options, allOffsets[MsgOptionsModel]!, allOffsets);
  bytesCount += 3 + object.senderId.length * 3;
  bytesCount += 3 + object.senderInfo.length * 3;
  {
    final value = object.serverMsgId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _msgModelSerialize(
  MsgModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.atUsers);
  writer.writeString(offsets[1], object.clientMsgId);
  writer.writeLong(offsets[2], object.clientTime);
  writer.writeString(offsets[3], object.content);
  writer.writeLong(offsets[4], object.contentType);
  writer.writeString(offsets[5], object.convId);
  writer.writeBool(offsets[6], object.deleted);
  writer.writeString(offsets[7], object.ext);
  writer.writeObject<MsgOfflinePushModel>(
    offsets[8],
    allOffsets,
    MsgOfflinePushModelSchema.serialize,
    object.offlinePush,
  );
  writer.writeObject<MsgOptionsModel>(
    offsets[9],
    allOffsets,
    MsgOptionsModelSchema.serialize,
    object.options,
  );
  writer.writeLong(offsets[10], object.sendProgress);
  writer.writeLong(offsets[11], object.sendStatus);
  writer.writeString(offsets[12], object.senderId);
  writer.writeString(offsets[13], object.senderInfo);
  writer.writeLong(offsets[14], object.seq);
  writer.writeString(offsets[15], object.serverMsgId);
  writer.writeLong(offsets[16], object.serverTime);
}

MsgModel _msgModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MsgModel(
    atUsers: reader.readStringList(offsets[0]) ?? [],
    clientMsgId: reader.readString(offsets[1]),
    clientTime: reader.readLong(offsets[2]),
    content: reader.readString(offsets[3]),
    contentType: reader.readLong(offsets[4]),
    convId: reader.readString(offsets[5]),
    deleted: reader.readBoolOrNull(offsets[6]) ?? false,
    ext: reader.readStringOrNull(offsets[7]) ?? "",
    offlinePush: reader.readObjectOrNull<MsgOfflinePushModel>(
          offsets[8],
          MsgOfflinePushModelSchema.deserialize,
          allOffsets,
        ) ??
        MsgOfflinePushModel(),
    options: reader.readObjectOrNull<MsgOptionsModel>(
          offsets[9],
          MsgOptionsModelSchema.deserialize,
          allOffsets,
        ) ??
        MsgOptionsModel(),
    sendProgress: reader.readLongOrNull(offsets[10]) ?? 0,
    sendStatus: reader.readLongOrNull(offsets[11]) ?? SendStatus.sending,
    senderId: reader.readString(offsets[12]),
    senderInfo: reader.readStringOrNull(offsets[13]) ?? "",
    seq: reader.readLong(offsets[14]),
    serverMsgId: reader.readStringOrNull(offsets[15]),
    serverTime: reader.readLong(offsets[16]),
  );
  object.id = id;
  return object;
}

P _msgModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
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
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 8:
      return (reader.readObjectOrNull<MsgOfflinePushModel>(
            offset,
            MsgOfflinePushModelSchema.deserialize,
            allOffsets,
          ) ??
          MsgOfflinePushModel()) as P;
    case 9:
      return (reader.readObjectOrNull<MsgOptionsModel>(
            offset,
            MsgOptionsModelSchema.deserialize,
            allOffsets,
          ) ??
          MsgOptionsModel()) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 11:
      return (reader.readLongOrNull(offset) ?? SendStatus.sending) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _msgModelGetId(MsgModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _msgModelGetLinks(MsgModel object) {
  return [];
}

void _msgModelAttach(IsarCollection<dynamic> col, Id id, MsgModel object) {
  object.id = id;
}

extension MsgModelQueryWhereSort on QueryBuilder<MsgModel, MsgModel, QWhere> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'contentType'),
      );
    });
  }
}

extension MsgModelQueryWhere on QueryBuilder<MsgModel, MsgModel, QWhereClause> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIdEqualTo(
      String clientMsgId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMsgId',
        value: [clientMsgId],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIdNotEqualTo(
      String clientMsgId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMsgId',
              lower: [],
              upper: [clientMsgId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMsgId',
              lower: [clientMsgId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMsgId',
              lower: [clientMsgId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMsgId',
              lower: [],
              upper: [clientMsgId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIdEqualTo(
      String senderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderId',
        value: [senderId],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIdNotEqualTo(
      String senderId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId',
              lower: [],
              upper: [senderId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId',
              lower: [senderId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId',
              lower: [senderId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderId',
              lower: [],
              upper: [senderId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'convId',
        value: [convId],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIdNotEqualTo(
      String convId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convId',
              lower: [],
              upper: [convId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convId',
              lower: [convId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convId',
              lower: [convId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convId',
              lower: [],
              upper: [convId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeEqualTo(
      int contentType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contentType',
        value: [contentType],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeNotEqualTo(
      int contentType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentType',
              lower: [],
              upper: [contentType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentType',
              lower: [contentType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentType',
              lower: [contentType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contentType',
              lower: [],
              upper: [contentType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeGreaterThan(
    int contentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentType',
        lower: [contentType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeLessThan(
    int contentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentType',
        lower: [],
        upper: [contentType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeBetween(
    int lowerContentType,
    int upperContentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contentType',
        lower: [lowerContentType],
        includeLower: includeLower,
        upper: [upperContentType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentEqualTo(
      String content) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'content',
        value: [content],
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentNotEqualTo(
      String content) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'content',
              lower: [],
              upper: [content],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'content',
              lower: [content],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'content',
              lower: [content],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'content',
              lower: [],
              upper: [content],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MsgModelQueryFilter
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {
  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'atUsers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'atUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'atUsers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'atUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      atUsersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> atUsersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'atUsers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      clientMsgIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientMsgId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientMsgId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      clientMsgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentType',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      contentTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contentType',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contentType',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'convId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'convId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ext',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ext',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ext',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> extIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ext',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sendProgress',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      sendProgressGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sendProgress',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sendProgress',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendProgressBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sendProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sendStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sendStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sendStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sendStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      senderInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seq',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seq',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seq',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverMsgId',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      serverMsgIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverMsgId',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      serverMsgIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverMsgId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverMsgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverMsgId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      serverMsgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MsgModelQueryObject
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {
  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePush(
      FilterQuery<MsgOfflinePushModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'offlinePush');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> options(
      FilterQuery<MsgOptionsModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'options');
    });
  }
}

extension MsgModelQueryLinks
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {}

extension MsgModelQuerySortBy on QueryBuilder<MsgModel, MsgModel, QSortBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTime', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTime', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByExt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ext', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByExtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ext', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendProgress', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendProgress', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendStatus', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendStatus', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderInfo', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderInfo', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverMsgId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverMsgId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTime', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTime', Sort.desc);
    });
  }
}

extension MsgModelQuerySortThenBy
    on QueryBuilder<MsgModel, MsgModel, QSortThenBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTime', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTime', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByExt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ext', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByExtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ext', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendProgress', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendProgress', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendStatus', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendStatus', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderInfo', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderInfo', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverMsgId', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverMsgId', Sort.desc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTime', Sort.asc);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverTime', Sort.desc);
    });
  }
}

extension MsgModelQueryWhereDistinct
    on QueryBuilder<MsgModel, MsgModel, QDistinct> {
  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByAtUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atUsers');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientMsgId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientMsgId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientTime');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentType');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByExt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ext', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySendProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sendProgress');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySendStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sendStatus');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySenderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySenderInfo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderInfo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seq');
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerMsgId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverMsgId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverTime');
    });
  }
}

extension MsgModelQueryProperty
    on QueryBuilder<MsgModel, MsgModel, QQueryProperty> {
  QueryBuilder<MsgModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MsgModel, List<String>, QQueryOperations> atUsersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atUsers');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> clientMsgIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientMsgId');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> clientTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientTime');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> contentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentType');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> convIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convId');
    });
  }

  QueryBuilder<MsgModel, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> extProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ext');
    });
  }

  QueryBuilder<MsgModel, MsgOfflinePushModel, QQueryOperations>
      offlinePushProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offlinePush');
    });
  }

  QueryBuilder<MsgModel, MsgOptionsModel, QQueryOperations> optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> sendProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sendProgress');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> sendStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sendStatus');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> senderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderId');
    });
  }

  QueryBuilder<MsgModel, String, QQueryOperations> senderInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderInfo');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> seqProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seq');
    });
  }

  QueryBuilder<MsgModel, String?, QQueryOperations> serverMsgIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverMsgId');
    });
  }

  QueryBuilder<MsgModel, int, QQueryOperations> serverTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverTime');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const MsgOptionsModelSchema = Schema(
  name: r'MsgOptionsModel',
  id: 2661845657255567082,
  properties: {
    r'needDecrypt': PropertySchema(
      id: 0,
      name: r'needDecrypt',
      type: IsarType.bool,
    ),
    r'offlinePush': PropertySchema(
      id: 1,
      name: r'offlinePush',
      type: IsarType.bool,
    ),
    r'storageForClient': PropertySchema(
      id: 2,
      name: r'storageForClient',
      type: IsarType.bool,
    ),
    r'storageForServer': PropertySchema(
      id: 3,
      name: r'storageForServer',
      type: IsarType.bool,
    ),
    r'updateConvMsg': PropertySchema(
      id: 4,
      name: r'updateConvMsg',
      type: IsarType.bool,
    ),
    r'updateUnreadCount': PropertySchema(
      id: 5,
      name: r'updateUnreadCount',
      type: IsarType.bool,
    )
  },
  estimateSize: _msgOptionsModelEstimateSize,
  serialize: _msgOptionsModelSerialize,
  deserialize: _msgOptionsModelDeserialize,
  deserializeProp: _msgOptionsModelDeserializeProp,
);

int _msgOptionsModelEstimateSize(
  MsgOptionsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _msgOptionsModelSerialize(
  MsgOptionsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.needDecrypt);
  writer.writeBool(offsets[1], object.offlinePush);
  writer.writeBool(offsets[2], object.storageForClient);
  writer.writeBool(offsets[3], object.storageForServer);
  writer.writeBool(offsets[4], object.updateConvMsg);
  writer.writeBool(offsets[5], object.updateUnreadCount);
}

MsgOptionsModel _msgOptionsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MsgOptionsModel(
    needDecrypt: reader.readBoolOrNull(offsets[0]),
    offlinePush: reader.readBoolOrNull(offsets[1]),
    storageForClient: reader.readBoolOrNull(offsets[2]),
    storageForServer: reader.readBoolOrNull(offsets[3]),
    updateConvMsg: reader.readBoolOrNull(offsets[4]),
    updateUnreadCount: reader.readBoolOrNull(offsets[5]),
  );
  return object;
}

P _msgOptionsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MsgOptionsModelQueryFilter
    on QueryBuilder<MsgOptionsModel, MsgOptionsModel, QFilterCondition> {
  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      needDecryptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'needDecrypt',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      needDecryptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'needDecrypt',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      needDecryptEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needDecrypt',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      offlinePushIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'offlinePush',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      offlinePushIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'offlinePush',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      offlinePushEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'offlinePush',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForClientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storageForClient',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForClientIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storageForClient',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForClientEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storageForClient',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForServerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storageForServer',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForServerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storageForServer',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      storageForServerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storageForServer',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateConvMsgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateConvMsg',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateConvMsgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateConvMsg',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateConvMsgEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateConvMsg',
        value: value,
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateUnreadCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateUnreadCount',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateUnreadCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateUnreadCount',
      ));
    });
  }

  QueryBuilder<MsgOptionsModel, MsgOptionsModel, QAfterFilterCondition>
      updateUnreadCountEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateUnreadCount',
        value: value,
      ));
    });
  }
}

extension MsgOptionsModelQueryObject
    on QueryBuilder<MsgOptionsModel, MsgOptionsModel, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const MsgOfflinePushModelSchema = Schema(
  name: r'MsgOfflinePushModel',
  id: -722606130927360734,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'payload': PropertySchema(
      id: 1,
      name: r'payload',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _msgOfflinePushModelEstimateSize,
  serialize: _msgOfflinePushModelSerialize,
  deserialize: _msgOfflinePushModelDeserialize,
  deserializeProp: _msgOfflinePushModelDeserializeProp,
);

int _msgOfflinePushModelEstimateSize(
  MsgOfflinePushModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.payload;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _msgOfflinePushModelSerialize(
  MsgOfflinePushModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeString(offsets[1], object.payload);
  writer.writeString(offsets[2], object.title);
}

MsgOfflinePushModel _msgOfflinePushModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MsgOfflinePushModel(
    content: reader.readStringOrNull(offsets[0]),
    payload: reader.readStringOrNull(offsets[1]),
    title: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _msgOfflinePushModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MsgOfflinePushModelQueryFilter on QueryBuilder<MsgOfflinePushModel,
    MsgOfflinePushModel, QFilterCondition> {
  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payload',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payload',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MsgOfflinePushModel, MsgOfflinePushModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension MsgOfflinePushModelQueryObject on QueryBuilder<MsgOfflinePushModel,
    MsgOfflinePushModel, QFilterCondition> {}
