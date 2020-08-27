// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Glucose extends DataClass implements Insertable<Glucose> {
  final int id;
  final int level;
  final String moment;
  final DateTime date;
  final String note;
  Glucose(
      {@required this.id,
      @required this.level,
      @required this.moment,
      @required this.date,
      @required this.note});
  factory Glucose.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Glucose(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      level: intType.mapFromDatabaseResponse(data['${effectivePrefix}level']),
      moment:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}moment']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<int>(level);
    }
    if (!nullToAbsent || moment != null) {
      map['moment'] = Variable<String>(moment);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  GlucosesCompanion toCompanion(bool nullToAbsent) {
    return GlucosesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
      moment:
          moment == null && nullToAbsent ? const Value.absent() : Value(moment),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Glucose.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Glucose(
      id: serializer.fromJson<int>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      moment: serializer.fromJson<String>(json['moment']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'level': serializer.toJson<int>(level),
      'moment': serializer.toJson<String>(moment),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String>(note),
    };
  }

  Glucose copyWith(
          {int id, int level, String moment, DateTime date, String note}) =>
      Glucose(
        id: id ?? this.id,
        level: level ?? this.level,
        moment: moment ?? this.moment,
        date: date ?? this.date,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Glucose(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('moment: $moment, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(level.hashCode,
          $mrjc(moment.hashCode, $mrjc(date.hashCode, note.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Glucose &&
          other.id == this.id &&
          other.level == this.level &&
          other.moment == this.moment &&
          other.date == this.date &&
          other.note == this.note);
}

class GlucosesCompanion extends UpdateCompanion<Glucose> {
  final Value<int> id;
  final Value<int> level;
  final Value<String> moment;
  final Value<DateTime> date;
  final Value<String> note;
  const GlucosesCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.moment = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
  });
  GlucosesCompanion.insert({
    this.id = const Value.absent(),
    @required int level,
    @required String moment,
    @required DateTime date,
    @required String note,
  })  : level = Value(level),
        moment = Value(moment),
        date = Value(date),
        note = Value(note);
  static Insertable<Glucose> custom({
    Expression<int> id,
    Expression<int> level,
    Expression<String> moment,
    Expression<DateTime> date,
    Expression<String> note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (moment != null) 'moment': moment,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
    });
  }

  GlucosesCompanion copyWith(
      {Value<int> id,
      Value<int> level,
      Value<String> moment,
      Value<DateTime> date,
      Value<String> note}) {
    return GlucosesCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      moment: moment ?? this.moment,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (moment.present) {
      map['moment'] = Variable<String>(moment.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlucosesCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('moment: $moment, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $GlucosesTable extends Glucoses with TableInfo<$GlucosesTable, Glucose> {
  final GeneratedDatabase _db;
  final String _alias;
  $GlucosesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _levelMeta = const VerificationMeta('level');
  GeneratedIntColumn _level;
  @override
  GeneratedIntColumn get level => _level ??= _constructLevel();
  GeneratedIntColumn _constructLevel() {
    return GeneratedIntColumn(
      'level',
      $tableName,
      false,
    );
  }

  final VerificationMeta _momentMeta = const VerificationMeta('moment');
  GeneratedTextColumn _moment;
  @override
  GeneratedTextColumn get moment => _moment ??= _constructMoment();
  GeneratedTextColumn _constructMoment() {
    return GeneratedTextColumn('moment', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        minTextLength: 0, maxTextLength: 150);
  }

  @override
  List<GeneratedColumn> get $columns => [id, level, moment, date, note];
  @override
  $GlucosesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'glucoses';
  @override
  final String actualTableName = 'glucoses';
  @override
  VerificationContext validateIntegrity(Insertable<Glucose> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level'], _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('moment')) {
      context.handle(_momentMeta,
          moment.isAcceptableOrUnknown(data['moment'], _momentMeta));
    } else if (isInserting) {
      context.missing(_momentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Glucose map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Glucose.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GlucosesTable createAlias(String alias) {
    return $GlucosesTable(_db, alias);
  }
}

class Insulin extends DataClass implements Insertable<Insulin> {
  final int id;
  final int dosis;
  final String moment;
  final DateTime date;
  Insulin(
      {@required this.id,
      @required this.dosis,
      @required this.moment,
      @required this.date});
  factory Insulin.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Insulin(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dosis: intType.mapFromDatabaseResponse(data['${effectivePrefix}dosis']),
      moment:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}moment']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dosis != null) {
      map['dosis'] = Variable<int>(dosis);
    }
    if (!nullToAbsent || moment != null) {
      map['moment'] = Variable<String>(moment);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  InsulinsCompanion toCompanion(bool nullToAbsent) {
    return InsulinsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dosis:
          dosis == null && nullToAbsent ? const Value.absent() : Value(dosis),
      moment:
          moment == null && nullToAbsent ? const Value.absent() : Value(moment),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Insulin.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Insulin(
      id: serializer.fromJson<int>(json['id']),
      dosis: serializer.fromJson<int>(json['dosis']),
      moment: serializer.fromJson<String>(json['moment']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dosis': serializer.toJson<int>(dosis),
      'moment': serializer.toJson<String>(moment),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Insulin copyWith({int id, int dosis, String moment, DateTime date}) =>
      Insulin(
        id: id ?? this.id,
        dosis: dosis ?? this.dosis,
        moment: moment ?? this.moment,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Insulin(')
          ..write('id: $id, ')
          ..write('dosis: $dosis, ')
          ..write('moment: $moment, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(dosis.hashCode, $mrjc(moment.hashCode, date.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Insulin &&
          other.id == this.id &&
          other.dosis == this.dosis &&
          other.moment == this.moment &&
          other.date == this.date);
}

class InsulinsCompanion extends UpdateCompanion<Insulin> {
  final Value<int> id;
  final Value<int> dosis;
  final Value<String> moment;
  final Value<DateTime> date;
  const InsulinsCompanion({
    this.id = const Value.absent(),
    this.dosis = const Value.absent(),
    this.moment = const Value.absent(),
    this.date = const Value.absent(),
  });
  InsulinsCompanion.insert({
    this.id = const Value.absent(),
    @required int dosis,
    @required String moment,
    @required DateTime date,
  })  : dosis = Value(dosis),
        moment = Value(moment),
        date = Value(date);
  static Insertable<Insulin> custom({
    Expression<int> id,
    Expression<int> dosis,
    Expression<String> moment,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dosis != null) 'dosis': dosis,
      if (moment != null) 'moment': moment,
      if (date != null) 'date': date,
    });
  }

  InsulinsCompanion copyWith(
      {Value<int> id,
      Value<int> dosis,
      Value<String> moment,
      Value<DateTime> date}) {
    return InsulinsCompanion(
      id: id ?? this.id,
      dosis: dosis ?? this.dosis,
      moment: moment ?? this.moment,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dosis.present) {
      map['dosis'] = Variable<int>(dosis.value);
    }
    if (moment.present) {
      map['moment'] = Variable<String>(moment.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsulinsCompanion(')
          ..write('id: $id, ')
          ..write('dosis: $dosis, ')
          ..write('moment: $moment, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $InsulinsTable extends Insulins with TableInfo<$InsulinsTable, Insulin> {
  final GeneratedDatabase _db;
  final String _alias;
  $InsulinsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dosisMeta = const VerificationMeta('dosis');
  GeneratedIntColumn _dosis;
  @override
  GeneratedIntColumn get dosis => _dosis ??= _constructDosis();
  GeneratedIntColumn _constructDosis() {
    return GeneratedIntColumn(
      'dosis',
      $tableName,
      false,
    );
  }

  final VerificationMeta _momentMeta = const VerificationMeta('moment');
  GeneratedTextColumn _moment;
  @override
  GeneratedTextColumn get moment => _moment ??= _constructMoment();
  GeneratedTextColumn _constructMoment() {
    return GeneratedTextColumn('moment', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, dosis, moment, date];
  @override
  $InsulinsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'insulins';
  @override
  final String actualTableName = 'insulins';
  @override
  VerificationContext validateIntegrity(Insertable<Insulin> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('dosis')) {
      context.handle(
          _dosisMeta, dosis.isAcceptableOrUnknown(data['dosis'], _dosisMeta));
    } else if (isInserting) {
      context.missing(_dosisMeta);
    }
    if (data.containsKey('moment')) {
      context.handle(_momentMeta,
          moment.isAcceptableOrUnknown(data['moment'], _momentMeta));
    } else if (isInserting) {
      context.missing(_momentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Insulin map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Insulin.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InsulinsTable createAlias(String alias) {
    return $InsulinsTable(_db, alias);
  }
}

class Weight extends DataClass implements Insertable<Weight> {
  final int id;
  final double weight;
  final DateTime date;
  Weight({@required this.id, @required this.weight, @required this.date});
  factory Weight.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Weight(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  WeightsCompanion toCompanion(bool nullToAbsent) {
    return WeightsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Weight.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Weight(
      id: serializer.fromJson<int>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weight': serializer.toJson<double>(weight),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Weight copyWith({int id, double weight, DateTime date}) => Weight(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Weight(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(weight.hashCode, date.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Weight &&
          other.id == this.id &&
          other.weight == this.weight &&
          other.date == this.date);
}

class WeightsCompanion extends UpdateCompanion<Weight> {
  final Value<int> id;
  final Value<double> weight;
  final Value<DateTime> date;
  const WeightsCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.date = const Value.absent(),
  });
  WeightsCompanion.insert({
    this.id = const Value.absent(),
    @required double weight,
    @required DateTime date,
  })  : weight = Value(weight),
        date = Value(date);
  static Insertable<Weight> custom({
    Expression<int> id,
    Expression<double> weight,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weight != null) 'weight': weight,
      if (date != null) 'date': date,
    });
  }

  WeightsCompanion copyWith(
      {Value<int> id, Value<double> weight, Value<DateTime> date}) {
    return WeightsCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightsCompanion(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $WeightsTable extends Weights with TableInfo<$WeightsTable, Weight> {
  final GeneratedDatabase _db;
  final String _alias;
  $WeightsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, weight, date];
  @override
  $WeightsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'weights';
  @override
  final String actualTableName = 'weights';
  @override
  VerificationContext validateIntegrity(Insertable<Weight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Weight map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Weight.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WeightsTable createAlias(String alias) {
    return $WeightsTable(_db, alias);
  }
}

class Activity extends DataClass implements Insertable<Activity> {
  final int id;
  final String name;
  final String type;
  final DateTime date;
  final DateTime timeIni;
  final DateTime timeEnd;
  final String note;
  Activity(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.date,
      @required this.timeIni,
      @required this.timeEnd,
      @required this.note});
  factory Activity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Activity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      timeIni: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_ini']),
      timeEnd: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_end']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || timeIni != null) {
      map['time_ini'] = Variable<DateTime>(timeIni);
    }
    if (!nullToAbsent || timeEnd != null) {
      map['time_end'] = Variable<DateTime>(timeEnd);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ActivitiesCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      timeIni: timeIni == null && nullToAbsent
          ? const Value.absent()
          : Value(timeIni),
      timeEnd: timeEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(timeEnd),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Activity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Activity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      date: serializer.fromJson<DateTime>(json['date']),
      timeIni: serializer.fromJson<DateTime>(json['timeIni']),
      timeEnd: serializer.fromJson<DateTime>(json['timeEnd']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'date': serializer.toJson<DateTime>(date),
      'timeIni': serializer.toJson<DateTime>(timeIni),
      'timeEnd': serializer.toJson<DateTime>(timeEnd),
      'note': serializer.toJson<String>(note),
    };
  }

  Activity copyWith(
          {int id,
          String name,
          String type,
          DateTime date,
          DateTime timeIni,
          DateTime timeEnd,
          String note}) =>
      Activity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        date: date ?? this.date,
        timeIni: timeIni ?? this.timeIni,
        timeEnd: timeEnd ?? this.timeEnd,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Activity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('timeIni: $timeIni, ')
          ..write('timeEnd: $timeEnd, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              type.hashCode,
              $mrjc(
                  date.hashCode,
                  $mrjc(timeIni.hashCode,
                      $mrjc(timeEnd.hashCode, note.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Activity &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.date == this.date &&
          other.timeIni == this.timeIni &&
          other.timeEnd == this.timeEnd &&
          other.note == this.note);
}

class ActivitiesCompanion extends UpdateCompanion<Activity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<DateTime> date;
  final Value<DateTime> timeIni;
  final Value<DateTime> timeEnd;
  final Value<String> note;
  const ActivitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.timeIni = const Value.absent(),
    this.timeEnd = const Value.absent(),
    this.note = const Value.absent(),
  });
  ActivitiesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String type,
    @required DateTime date,
    @required DateTime timeIni,
    @required DateTime timeEnd,
    @required String note,
  })  : name = Value(name),
        type = Value(type),
        date = Value(date),
        timeIni = Value(timeIni),
        timeEnd = Value(timeEnd),
        note = Value(note);
  static Insertable<Activity> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> type,
    Expression<DateTime> date,
    Expression<DateTime> timeIni,
    Expression<DateTime> timeEnd,
    Expression<String> note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (timeIni != null) 'time_ini': timeIni,
      if (timeEnd != null) 'time_end': timeEnd,
      if (note != null) 'note': note,
    });
  }

  ActivitiesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<DateTime> date,
      Value<DateTime> timeIni,
      Value<DateTime> timeEnd,
      Value<String> note}) {
    return ActivitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      date: date ?? this.date,
      timeIni: timeIni ?? this.timeIni,
      timeEnd: timeEnd ?? this.timeEnd,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timeIni.present) {
      map['time_ini'] = Variable<DateTime>(timeIni.value);
    }
    if (timeEnd.present) {
      map['time_end'] = Variable<DateTime>(timeEnd.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('timeIni: $timeIni, ')
          ..write('timeEnd: $timeEnd, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTable extends Activities
    with TableInfo<$ActivitiesTable, Activity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ActivitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, false,
        minTextLength: 1, maxTextLength: 15);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeIniMeta = const VerificationMeta('timeIni');
  GeneratedDateTimeColumn _timeIni;
  @override
  GeneratedDateTimeColumn get timeIni => _timeIni ??= _constructTimeIni();
  GeneratedDateTimeColumn _constructTimeIni() {
    return GeneratedDateTimeColumn(
      'time_ini',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeEndMeta = const VerificationMeta('timeEnd');
  GeneratedDateTimeColumn _timeEnd;
  @override
  GeneratedDateTimeColumn get timeEnd => _timeEnd ??= _constructTimeEnd();
  GeneratedDateTimeColumn _constructTimeEnd() {
    return GeneratedDateTimeColumn(
      'time_end',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        minTextLength: 0, maxTextLength: 150);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, date, timeIni, timeEnd, note];
  @override
  $ActivitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activities';
  @override
  final String actualTableName = 'activities';
  @override
  VerificationContext validateIntegrity(Insertable<Activity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time_ini')) {
      context.handle(_timeIniMeta,
          timeIni.isAcceptableOrUnknown(data['time_ini'], _timeIniMeta));
    } else if (isInserting) {
      context.missing(_timeIniMeta);
    }
    if (data.containsKey('time_end')) {
      context.handle(_timeEndMeta,
          timeEnd.isAcceptableOrUnknown(data['time_end'], _timeEndMeta));
    } else if (isInserting) {
      context.missing(_timeEndMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Activity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Activity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ActivitiesTable createAlias(String alias) {
    return $ActivitiesTable(_db, alias);
  }
}

abstract class _$DiabetesDatabase extends GeneratedDatabase {
  _$DiabetesDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GlucosesTable _glucoses;
  $GlucosesTable get glucoses => _glucoses ??= $GlucosesTable(this);
  $InsulinsTable _insulins;
  $InsulinsTable get insulins => _insulins ??= $InsulinsTable(this);
  $WeightsTable _weights;
  $WeightsTable get weights => _weights ??= $WeightsTable(this);
  $ActivitiesTable _activities;
  $ActivitiesTable get activities => _activities ??= $ActivitiesTable(this);
  GlucoseDao _glucoseDao;
  GlucoseDao get glucoseDao =>
      _glucoseDao ??= GlucoseDao(this as DiabetesDatabase);
  InsulinDao _insulinDao;
  InsulinDao get insulinDao =>
      _insulinDao ??= InsulinDao(this as DiabetesDatabase);
  WeightDao _weightDao;
  WeightDao get weightDao => _weightDao ??= WeightDao(this as DiabetesDatabase);
  ActivityDao _activityDao;
  ActivityDao get activityDao =>
      _activityDao ??= ActivityDao(this as DiabetesDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [glucoses, insulins, weights, activities];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$GlucoseDaoMixin on DatabaseAccessor<DiabetesDatabase> {
  $GlucosesTable get glucoses => attachedDatabase.glucoses;
}
mixin _$InsulinDaoMixin on DatabaseAccessor<DiabetesDatabase> {
  $InsulinsTable get insulins => attachedDatabase.insulins;
}
mixin _$WeightDaoMixin on DatabaseAccessor<DiabetesDatabase> {
  $WeightsTable get weights => attachedDatabase.weights;
}
mixin _$ActivityDaoMixin on DatabaseAccessor<DiabetesDatabase> {
  $ActivitiesTable get activities => attachedDatabase.activities;
}
