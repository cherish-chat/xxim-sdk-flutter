// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRecordModelCollection on Isar {
  IsarCollection<RecordModel> get recordModels => this.collection();
}

const RecordModelSchema = CollectionSchema(
  name: r'RecordModel',
  id: 971936938898302464,
  properties: {
    r'convId': PropertySchema(
      id: 0,
      name: r'convId',
      type: IsarType.string,
    ),
    r'maxSeq': PropertySchema(
      id: 1,
      name: r'maxSeq',
      type: IsarType.long,
    ),
    r'minSeq': PropertySchema(
      id: 2,
      name: r'minSeq',
      type: IsarType.long,
    ),
    r'seq': PropertySchema(
      id: 3,
      name: r'seq',
      type: IsarType.long,
    ),
    r'updateTime': PropertySchema(
      id: 4,
      name: r'updateTime',
      type: IsarType.long,
    )
  },
  estimateSize: _recordModelEstimateSize,
  serialize: _recordModelSerialize,
  deserialize: _recordModelDeserialize,
  deserializeProp: _recordModelDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _recordModelGetId,
  getLinks: _recordModelGetLinks,
  attach: _recordModelAttach,
  version: '3.0.2',
);

int _recordModelEstimateSize(
  RecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.convId.length * 3;
  return bytesCount;
}

void _recordModelSerialize(
  RecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.convId);
  writer.writeLong(offsets[1], object.maxSeq);
  writer.writeLong(offsets[2], object.minSeq);
  writer.writeLong(offsets[3], object.seq);
  writer.writeLong(offsets[4], object.updateTime);
}

RecordModel _recordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecordModel(
    convId: reader.readString(offsets[0]),
    maxSeq: reader.readLong(offsets[1]),
    minSeq: reader.readLong(offsets[2]),
    seq: reader.readLongOrNull(offsets[3]) ?? 0,
    updateTime: reader.readLong(offsets[4]),
  );
  object.id = id;
  return object;
}

P _recordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recordModelGetId(RecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordModelGetLinks(RecordModel object) {
  return [];
}

void _recordModelAttach(
    IsarCollection<dynamic> col, Id id, RecordModel object) {
  object.id = id;
}

extension RecordModelQueryWhereSort
    on QueryBuilder<RecordModel, RecordModel, QWhere> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordModelQueryWhere
    on QueryBuilder<RecordModel, RecordModel, QWhereClause> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIdEqualTo(
      String convId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'convId',
        value: [convId],
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIdNotEqualTo(
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
}

extension RecordModelQueryFilter
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {
  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdEqualTo(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdGreaterThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdLessThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdBetween(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdStartsWith(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdEndsWith(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdContains(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIdMatches(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'convId',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      maxSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> maxSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      minSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minSeq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> minSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minSeq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seq',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqGreaterThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqLessThan(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqBetween(
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

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      updateTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordModelQueryObject
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {}

extension RecordModelQueryLinks
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {}

extension RecordModelQuerySortBy
    on QueryBuilder<RecordModel, RecordModel, QSortBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMaxSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSeq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMaxSeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSeq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMinSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSeq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByMinSeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSeq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension RecordModelQuerySortThenBy
    on QueryBuilder<RecordModel, RecordModel, QSortThenBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convId', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMaxSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSeq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMaxSeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSeq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMinSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSeq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByMinSeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minSeq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seq', Sort.desc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension RecordModelQueryWhereDistinct
    on QueryBuilder<RecordModel, RecordModel, QDistinct> {
  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByConvId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByMaxSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSeq');
    });
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByMinSeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minSeq');
    });
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctBySeq() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seq');
    });
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateTime');
    });
  }
}

extension RecordModelQueryProperty
    on QueryBuilder<RecordModel, RecordModel, QQueryProperty> {
  QueryBuilder<RecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecordModel, String, QQueryOperations> convIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convId');
    });
  }

  QueryBuilder<RecordModel, int, QQueryOperations> maxSeqProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSeq');
    });
  }

  QueryBuilder<RecordModel, int, QQueryOperations> minSeqProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minSeq');
    });
  }

  QueryBuilder<RecordModel, int, QQueryOperations> seqProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seq');
    });
  }

  QueryBuilder<RecordModel, int, QQueryOperations> updateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateTime');
    });
  }
}
