// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashflow.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCashFlowCollection on Isar {
  IsarCollection<CashFlow> get cashFlows => this.collection();
}

const CashFlowSchema = CollectionSchema(
  name: r'CashFlow',
  id: -6121784318378241409,
  properties: {
    r'daysCount': PropertySchema(
      id: 0,
      name: r'daysCount',
      type: IsarType.long,
    ),
    r'expenses': PropertySchema(
      id: 1,
      name: r'expenses',
      type: IsarType.double,
    ),
    r'expensesPercentage': PropertySchema(
      id: 2,
      name: r'expensesPercentage',
      type: IsarType.double,
    ),
    r'income': PropertySchema(
      id: 3,
      name: r'income',
      type: IsarType.double,
    ),
    r'incomePercentage': PropertySchema(
      id: 4,
      name: r'incomePercentage',
      type: IsarType.double,
    ),
    r'net': PropertySchema(
      id: 5,
      name: r'net',
      type: IsarType.double,
    )
  },
  estimateSize: _cashFlowEstimateSize,
  serialize: _cashFlowSerialize,
  deserialize: _cashFlowDeserialize,
  deserializeProp: _cashFlowDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cashFlowGetId,
  getLinks: _cashFlowGetLinks,
  attach: _cashFlowAttach,
  version: '3.0.5',
);

int _cashFlowEstimateSize(
  CashFlow object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cashFlowSerialize(
  CashFlow object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.daysCount);
  writer.writeDouble(offsets[1], object.expenses);
  writer.writeDouble(offsets[2], object.expensesPercentage);
  writer.writeDouble(offsets[3], object.income);
  writer.writeDouble(offsets[4], object.incomePercentage);
  writer.writeDouble(offsets[5], object.net);
}

CashFlow _cashFlowDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CashFlow(
    daysCount: reader.readLongOrNull(offsets[0]),
    expenses: reader.readDoubleOrNull(offsets[1]),
    expensesPercentage: reader.readDoubleOrNull(offsets[2]),
    id: id,
    income: reader.readDoubleOrNull(offsets[3]),
    incomePercentage: reader.readDoubleOrNull(offsets[4]),
    net: reader.readDoubleOrNull(offsets[5]),
  );
  return object;
}

P _cashFlowDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cashFlowGetId(CashFlow object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cashFlowGetLinks(CashFlow object) {
  return [];
}

void _cashFlowAttach(IsarCollection<dynamic> col, Id id, CashFlow object) {
  object.id = id;
}

extension CashFlowQueryWhereSort on QueryBuilder<CashFlow, CashFlow, QWhere> {
  QueryBuilder<CashFlow, CashFlow, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CashFlowQueryWhere on QueryBuilder<CashFlow, CashFlow, QWhereClause> {
  QueryBuilder<CashFlow, CashFlow, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CashFlow, CashFlow, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterWhereClause> idBetween(
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

extension CashFlowQueryFilter
    on QueryBuilder<CashFlow, CashFlow, QFilterCondition> {
  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'daysCount',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'daysCount',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysCount',
        value: value,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> daysCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> expensesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expensesPercentage',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expensesPercentage',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expensesPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expensesPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expensesPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      expensesPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expensesPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'income',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'income',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> incomeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'incomePercentage',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'incomePercentage',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incomePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incomePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incomePercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition>
      incomePercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incomePercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'net',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'net',
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'net',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'net',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'net',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterFilterCondition> netBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'net',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CashFlowQueryObject
    on QueryBuilder<CashFlow, CashFlow, QFilterCondition> {}

extension CashFlowQueryLinks
    on QueryBuilder<CashFlow, CashFlow, QFilterCondition> {}

extension CashFlowQuerySortBy on QueryBuilder<CashFlow, CashFlow, QSortBy> {
  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByDaysCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysCount', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByDaysCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysCount', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByExpensesPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expensesPercentage', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy>
      sortByExpensesPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expensesPercentage', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByIncomePercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomePercentage', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByIncomePercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomePercentage', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'net', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> sortByNetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'net', Sort.desc);
    });
  }
}

extension CashFlowQuerySortThenBy
    on QueryBuilder<CashFlow, CashFlow, QSortThenBy> {
  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByDaysCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysCount', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByDaysCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysCount', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenses', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByExpensesPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expensesPercentage', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy>
      thenByExpensesPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expensesPercentage', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByIncomePercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomePercentage', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByIncomePercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomePercentage', Sort.desc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'net', Sort.asc);
    });
  }

  QueryBuilder<CashFlow, CashFlow, QAfterSortBy> thenByNetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'net', Sort.desc);
    });
  }
}

extension CashFlowQueryWhereDistinct
    on QueryBuilder<CashFlow, CashFlow, QDistinct> {
  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByDaysCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysCount');
    });
  }

  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenses');
    });
  }

  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByExpensesPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expensesPercentage');
    });
  }

  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income');
    });
  }

  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByIncomePercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incomePercentage');
    });
  }

  QueryBuilder<CashFlow, CashFlow, QDistinct> distinctByNet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'net');
    });
  }
}

extension CashFlowQueryProperty
    on QueryBuilder<CashFlow, CashFlow, QQueryProperty> {
  QueryBuilder<CashFlow, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CashFlow, int?, QQueryOperations> daysCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysCount');
    });
  }

  QueryBuilder<CashFlow, double?, QQueryOperations> expensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenses');
    });
  }

  QueryBuilder<CashFlow, double?, QQueryOperations>
      expensesPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expensesPercentage');
    });
  }

  QueryBuilder<CashFlow, double?, QQueryOperations> incomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income');
    });
  }

  QueryBuilder<CashFlow, double?, QQueryOperations> incomePercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incomePercentage');
    });
  }

  QueryBuilder<CashFlow, double?, QQueryOperations> netProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'net');
    });
  }
}
