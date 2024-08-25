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
    r'imagePath': PropertySchema(
      id: 1,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.byte,
      enumMap: _FaceImageModelstatusEnumValueMap,
    )
  },
  estimateSize: _faceImageModelEstimateSize,
  serialize: _faceImageModelSerialize,
  deserialize: _faceImageModelDeserialize,
  deserializeProp: _faceImageModelDeserializeProp,
  idName: r'id',
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
  bytesCount += 3 + object.imagePath.length * 3;
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
  writer.writeString(offsets[1], object.imagePath);
  writer.writeByte(offsets[2], object.status.index);
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
    id: id,
    imagePath: reader.readString(offsets[1]),
    status:
        _FaceImageModelstatusValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            AbnormalityDetectionStatus.done,
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
      return (reader.readString(offset)) as P;
    case 2:
      return (_FaceImageModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AbnormalityDetectionStatus.done) as P;
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
  0: AbnormalityDetectionStatus.done,
  1: AbnormalityDetectionStatus.inProcess,
  2: AbnormalityDetectionStatus.initial,
};

Id _faceImageModelGetId(FaceImageModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _faceImageModelGetLinks(FaceImageModel object) {
  return [];
}

void _faceImageModelAttach(
    IsarCollection<dynamic> col, Id id, FaceImageModel object) {}

extension FaceImageModelQueryWhereSort
    on QueryBuilder<FaceImageModel, FaceImageModel, QWhere> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceImageModelQueryWhere
    on QueryBuilder<FaceImageModel, FaceImageModel, QWhereClause> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterWhereClause> idBetween(
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
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusEqualTo(AbnormalityDetectionStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterFilterCondition>
      statusGreaterThan(
    AbnormalityDetectionStatus value, {
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
    AbnormalityDetectionStatus value, {
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
    AbnormalityDetectionStatus lower,
    AbnormalityDetectionStatus upper, {
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
}

extension FaceImageModelQueryObject
    on QueryBuilder<FaceImageModel, FaceImageModel, QFilterCondition> {}

extension FaceImageModelQueryLinks
    on QueryBuilder<FaceImageModel, FaceImageModel, QFilterCondition> {}

extension FaceImageModelQuerySortBy
    on QueryBuilder<FaceImageModel, FaceImageModel, QSortBy> {
  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
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
}

extension FaceImageModelQuerySortThenBy
    on QueryBuilder<FaceImageModel, FaceImageModel, QSortThenBy> {
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

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
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
}

extension FaceImageModelQueryWhereDistinct
    on QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> {
  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct>
      distinctByAbnormalities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abnormalities');
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceImageModel, FaceImageModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension FaceImageModelQueryProperty
    on QueryBuilder<FaceImageModel, FaceImageModel, QQueryProperty> {
  QueryBuilder<FaceImageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceImageModel, List<AbnormalitiesEnum>?, QQueryOperations>
      abnormalitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abnormalities');
    });
  }

  QueryBuilder<FaceImageModel, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<FaceImageModel, AbnormalityDetectionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
