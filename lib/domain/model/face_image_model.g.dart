// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_image_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFaceImageModelCollection on Isar {
  IsarCollection<FaceImageModel> get faceImageModels => this.collection();
}

const FaceImageModelSchema = CollectionSchema(
  name: r'FaceImageEntity',
  id: 5278436469567743890,
  properties: {
    r'abnormalities': PropertySchema(
      id: 0,
      name: r'abnormalities',
      type: IsarType.byteList,
      enumMap: _FaceImageModelabnormalitiesEnumValueMap,
    ),
    r'height': PropertySchema(
      id: 1,
      name: r'height',
      type: IsarType.double,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.byte,
      enumMap: _FaceImageModelstatusEnumValueMap,
    ),
    r'width': PropertySchema(
      id: 4,
      name: r'width',
      type: IsarType.double,
    )
  },
  estimateSize: _faceImageModelEstimateSize,
  serialize: _faceImageModelSerialize,
  deserialize: _faceImageModelDeserialize,
  deserializeProp: _faceImageModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _faceImageModelGetId,
  getLinks: _faceImageModelGetLinks,
  attach: _faceImageModelAttach,
  version: '3.1.0+1',
);

int _faceImageModelEstimateSize(
  FaceImageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.abnormalities;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  return bytesCount;
}

void _faceImageModelSerialize(
  FaceImageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(
      offsets[0], object.abnormalities?.map((e) => e.index).toList());
  writer.writeDouble(offsets[1], object.height);
  writer.writeString(offsets[2], object.id);
  writer.writeByte(offsets[3], object.status.index);
  writer.writeDouble(offsets[4], object.width);
}

FaceImageModel _faceImageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FaceImageModel(
    abnormalities: reader
        .readByteList(offsets[0])
        ?.map((e) =>
            _FaceImageModelabnormalitiesValueEnumMap[e] ??
            AbnormalitiesEnum.foreheadWrinkles)
        .toList(),
    height: reader.readDouble(offsets[1]),
    id: reader.readString(offsets[2]),
    status:
        _FaceImageModelstatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            AbnormalityDetectionStatusEnum.done,
    width: reader.readDouble(offsets[4]),
  );
  return object;
}

P _faceImageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader
          .readByteList(offset)
          ?.map((e) =>
              _FaceImageModelabnormalitiesValueEnumMap[e] ??
              AbnormalitiesEnum.foreheadWrinkles)
          .toList()) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_FaceImageModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AbnormalityDetectionStatusEnum.done) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FaceImageModelabnormalitiesEnumValueMap = {
  'foreheadWrinkles': 0,
  'leftEyeFineLines': 1,
  'rightMidCheekPores': 2,
  'bottomRightLipFirmness': 3,
};
const _FaceImageModelabnormalitiesValueEnumMap = {
  0: AbnormalitiesEnum.foreheadWrinkles,
  1: AbnormalitiesEnum.leftEyeFineLines,
  2: AbnormalitiesEnum.rightMidCheekPores,
  3: AbnormalitiesEnum.bottomRightLipFirmness,
};
const _FaceImageModelstatusEnumValueMap = {
  'done': 0,
  'inProcess': 1,
  'initial': 2,
};
const _FaceImageModelstatusValueEnumMap = {
  0: AbnormalityDetectionStatusEnum.done,
  1: AbnormalityDetectionStatusEnum.inProcess,
  2: AbnormalityDetectionStatusEnum.initial,
};

Id _faceImageModelGetId(FaceImageModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _faceImageModelGetLinks(FaceImageModel object) {
  return [];
}

void _faceImageModelAttach(
    IsarCollection<dynamic> col, Id id, FaceImageModel object) {}

extension FaceImageModelQueryWhereSort
    on QueryBuilder<FaceImageModel, FaceImageModel, QWhere> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceImageModelQueryWhere
    on QueryBuilder<FaceImageModel, FaceImageModel, QWhereClause> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FaceImageModelQueryFilter
    on QueryBuilder<FaceImageModel, FaceImageModel, QFilterCondition> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abnormalities',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abnormalities',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesElementEqualTo(AbnormalitiesEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abnormalities',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesElementGreaterThan(
    AbnormalitiesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abnormalities',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesElementLessThan(
    AbnormalitiesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abnormalities',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesElementBetween(
    AbnormalitiesEnum lower,
    AbnormalitiesEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abnormalities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      abnormalitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abnormalities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusEqualTo(AbnormalityDetectionStatusEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusGreaterThan(
    AbnormalityDetectionStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusLessThan(
    AbnormalityDetectionStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusBetween(
    AbnormalityDetectionStatusEnum lower,
    AbnormalityDetectionStatusEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      widthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      widthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      widthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      widthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FaceImageModelQueryObject
    on QueryBuilder<FaceImageModel, FaceImageModel, QFilterCondition> {}

extension FaceImageModelQueryLinks
    on QueryBuilder<FaceImageModel, FaceImageModel, QFilterCondition> {}

extension FaceImageModelQuerySortBy
    on QueryBuilder<FaceImageModel, FaceImageModel, QSortBy> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension FaceImageModelQuerySortThenBy
    on QueryBuilder<FaceImageModel, FaceImageModel, QSortThenBy> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension FaceImageModelQueryWhereDistinct
    on QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> {
  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct>
      distinctByAbnormalities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abnormalities');
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'width');
    });
  }
}

extension FaceImageModelQueryProperty
    on QueryBuilder<FaceImageModel, FaceImageModel, QQueryProperty> {
  QueryBuilder<FaceImageModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<FaceImageModel, List<AbnormalitiesEnum>?, QQueryOperations>
      abnormalitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abnormalities');
    });
  }

  QueryBuilder<FaceImageModel, double, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<FaceImageModel, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceImageModel, AbnormalityDetectionStatusEnum, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<FaceImageModel, double, QQueryOperations> widthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'width');
    });
  }
}
