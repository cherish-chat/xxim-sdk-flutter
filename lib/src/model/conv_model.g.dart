// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conv_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetConvModelCollection on Isar {
  IsarCollection<ConvModel> get convModels => this.collection();
}

const ConvModelSchema = CollectionSchema(
  name: r'ConvModel',
  id: -3815468939617515110,
  properties: {
    r'clientMsgId': PropertySchema(
      id: 0,
      name: r'clientMsgId',
      type: IsarType.string,
    ),
    r'convId': PropertySchema(
      id: 1,
      name: r'convId',
      type: IsarType.string,
    ),
    r'convType': PropertySchema(
      id: 2,
      name: r'convType',
      type: IsarType.long,
    ),
    r'deleted': PropertySchema(
      id: 3,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'draftModel': PropertySchema(
      id: 4,
      name: r'draftModel',
      type: IsarType.object,
      target: r'DraftModel',
    ),
    r'hidden': PropertySchema(
      id: 5,
      name: r'hidden',
      type: IsarType.bool,
    ),
    r'noticeId': PropertySchema(
      id: 6,
      name: r'noticeId',
      type: IsarType.string,
    ),
    r'time': PropertySchema(
      id: 7,
      name: r'time',
      type: IsarType.long,
    ),
    r'unreadCount': PropertySchema(
      id: 8,
      name: r'unreadCount',
      type: IsarType.long,
    )
  },
  estimateSize: _convModelEstimateSize,
  serialize: _convModelSerialize,
  deserialize: _convModelDeserialize,
  deserializeProp: _convModelDeserializeProp,
  idName: r'id',
  indexes: {
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
    r'convType': IndexSchema(
      id: 6593274480720196002,
      name: r'convType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'convType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
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
    r'noticeId': IndexSchema(
      id: -4304276775649609611,
      name: r'noticeId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'noticeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'unreadCount': IndexSchema(
      id: 1929747360533418796,
      name: r'unreadCount',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'unreadCount',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'DraftModel': DraftModelSchema},
  getId: _convModelGetId,
  getLinks: _convModelGetLinks,
  attach: _convModelAttach,
  version: '3.0.2',
);

int _convModelEstimateSize(
  ConvModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clientMsgId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.convId.length * 3;
  {
    final value = object.draftModel;
    if (value != null) {
      bytesCount += 3 +
          DraftModelSchema.estimateSize(
              value, allOffsets[DraftModel]!, allOffsets);
    }
  }
  {
    final value = object.noticeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _convModelSerialize(
  ConvModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientMsgId);
  writer.writeString(offsets[1], object.convId);
  writer.writeLong(offsets[2], object.convType);
  writer.writeBool(offsets[3], object.deleted);
  writer.writeObject<DraftModel>(
    offsets[4],
    allOffsets,
    DraftModelSchema.serialize,
    object.draftModel,
  );
  writer.writeBool(offsets[5], object.hidden);
  writer.writeString(offsets[6], object.noticeId);
  writer.writeLong(offsets[7], object.time);
  writer.writeLong(offsets[8], object.unreadCount);
}

ConvModel _convModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ConvModel(
    clientMsgId: reader.readStringOrNull(offsets[0]),
    convId: reader.readString(offsets[1]),
    convType: reader.readLong(offsets[2]),
    deleted: reader.readBoolOrNull(offsets[3]) ?? false,
    draftModel: reader.readObjectOrNull<DraftModel>(
      offsets[4],
      DraftModelSchema.deserialize,
      allOffsets,
    ),
    hidden: reader.readBoolOrNull(offsets[5]) ?? false,
    noticeId: reader.readStringOrNull(offsets[6]),
    time: reader.readLongOrNull(offsets[7]) ?? 0,
    unreadCount: reader.readLongOrNull(offsets[8]) ?? 0,
  );
  object.id = id;
  return object;
}

P _convModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readObjectOrNull<DraftModel>(
        offset,
        DraftModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _convModelGetId(ConvModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _convModelGetLinks(ConvModel object) {
  return [];
}

void _convModelAttach(IsarCollection<dynamic> col, Id id, ConvModel object) {
  object.id = id;
}

extension ConvModelQueryWhereSort
    on QueryBuilder<ConvModel, ConvModel, QWhere> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyConvType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'convType'),
      );
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'unreadCount'),
      );
    });
  }
}

extension ConvModelQueryWhere
    on QueryBuilder<ConvModel, ConvModel, QWhereClause> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'convId',
        value: [convId],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIdNotEqualTo(
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeEqualTo(
      int convType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'convType',
        value: [convType],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeNotEqualTo(
      int convType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convType',
              lower: [],
              upper: [convType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convType',
              lower: [convType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convType',
              lower: [convType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'convType',
              lower: [],
              upper: [convType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeGreaterThan(
    int convType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'convType',
        lower: [convType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeLessThan(
    int convType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'convType',
        lower: [],
        upper: [convType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convTypeBetween(
    int lowerConvType,
    int upperConvType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'convType',
        lower: [lowerConvType],
        includeLower: includeLower,
        upper: [upperConvType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMsgId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clientMsgId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdEqualTo(
      String? clientMsgId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMsgId',
        value: [clientMsgId],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> clientMsgIdNotEqualTo(
      String? clientMsgId) {
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'noticeId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'noticeId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdEqualTo(
      String? noticeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'noticeId',
        value: [noticeId],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> noticeIdNotEqualTo(
      String? noticeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'noticeId',
              lower: [],
              upper: [noticeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'noticeId',
              lower: [noticeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'noticeId',
              lower: [noticeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'noticeId',
              lower: [],
              upper: [noticeId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountEqualTo(
      int unreadCount) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'unreadCount',
        value: [unreadCount],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountNotEqualTo(
      int unreadCount) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unreadCount',
              lower: [],
              upper: [unreadCount],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unreadCount',
              lower: [unreadCount],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unreadCount',
              lower: [unreadCount],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unreadCount',
              lower: [],
              upper: [unreadCount],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountGreaterThan(
    int unreadCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unreadCount',
        lower: [unreadCount],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountLessThan(
    int unreadCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unreadCount',
        lower: [],
        upper: [unreadCount],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> unreadCountBetween(
    int lowerUnreadCount,
    int upperUnreadCount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unreadCount',
        lower: [lowerUnreadCount],
        includeLower: includeLower,
        upper: [upperUnreadCount],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConvModelQueryFilter
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {
  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientMsgId',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientMsgId',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdEqualTo(
    String? value, {
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdGreaterThan(
    String? value, {
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdLessThan(
    String? value, {
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdStartsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdEndsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdContains(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> clientMsgIdMatches(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      clientMsgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientMsgId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdStartsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdContains(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdMatches(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convType',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'draftModel',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      draftModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'draftModel',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> hiddenEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hidden',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noticeId',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      noticeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noticeId',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noticeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noticeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noticeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> noticeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noticeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      noticeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noticeId',
        value: '',
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      unreadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unreadCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConvModelQueryObject
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {
  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModel(
      FilterQuery<DraftModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'draftModel');
    });
  }
}

extension ConvModelQueryLinks
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {}

extension ConvModelQuerySortBy on QueryBuilder<ConvModel, ConvModel, QSortBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByClientMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByClientMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convType', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convType', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hidden', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByHiddenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hidden', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByNoticeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noticeId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByNoticeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noticeId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unreadCount', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unreadCount', Sort.desc);
    });
  }
}

extension ConvModelQuerySortThenBy
    on QueryBuilder<ConvModel, ConvModel, QSortThenBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByClientMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByClientMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMsgId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convType', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convType', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hidden', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByHiddenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hidden', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByNoticeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noticeId', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByNoticeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noticeId', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unreadCount', Sort.asc);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unreadCount', Sort.desc);
    });
  }
}

extension ConvModelQueryWhereDistinct
    on QueryBuilder<ConvModel, ConvModel, QDistinct> {
  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByClientMsgId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientMsgId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByConvType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convType');
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByHidden() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hidden');
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByNoticeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noticeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unreadCount');
    });
  }
}

extension ConvModelQueryProperty
    on QueryBuilder<ConvModel, ConvModel, QQueryProperty> {
  QueryBuilder<ConvModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ConvModel, String?, QQueryOperations> clientMsgIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientMsgId');
    });
  }

  QueryBuilder<ConvModel, String, QQueryOperations> convIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convId');
    });
  }

  QueryBuilder<ConvModel, int, QQueryOperations> convTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convType');
    });
  }

  QueryBuilder<ConvModel, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<ConvModel, DraftModel?, QQueryOperations> draftModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'draftModel');
    });
  }

  QueryBuilder<ConvModel, bool, QQueryOperations> hiddenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hidden');
    });
  }

  QueryBuilder<ConvModel, String?, QQueryOperations> noticeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noticeId');
    });
  }

  QueryBuilder<ConvModel, int, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<ConvModel, int, QQueryOperations> unreadCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unreadCount');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DraftModelSchema = Schema(
  name: r'DraftModel',
  id: -370211399773282223,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'ext': PropertySchema(
      id: 1,
      name: r'ext',
      type: IsarType.string,
    )
  },
  estimateSize: _draftModelEstimateSize,
  serialize: _draftModelSerialize,
  deserialize: _draftModelDeserialize,
  deserializeProp: _draftModelDeserializeProp,
);

int _draftModelEstimateSize(
  DraftModel object,
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
    final value = object.ext;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _draftModelSerialize(
  DraftModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeString(offsets[1], object.ext);
}

DraftModel _draftModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftModel(
    content: reader.readStringOrNull(offsets[0]),
    ext: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _draftModelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DraftModelQueryFilter
    on QueryBuilder<DraftModel, DraftModel, QFilterCondition> {
  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentEqualTo(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition>
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentLessThan(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentBetween(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentStartsWith(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentEndsWith(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentContains(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentMatches(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ext',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ext',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extEqualTo(
    String? value, {
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extGreaterThan(
    String? value, {
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extLessThan(
    String? value, {
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extStartsWith(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extEndsWith(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extContains(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extMatches(
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

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ext',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftModel, DraftModel, QAfterFilterCondition> extIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ext',
        value: '',
      ));
    });
  }
}

extension DraftModelQueryObject
    on QueryBuilder<DraftModel, DraftModel, QFilterCondition> {}
