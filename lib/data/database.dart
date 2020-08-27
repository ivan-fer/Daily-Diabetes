import 'package:daily_diabetes/constants.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Glucoses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get level => integer()();
  TextColumn get moment => text().withLength(min: 1, max: 30)();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().withLength(min: 0, max: 150)();
}

class Insulins extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dosis => integer()();
  TextColumn get moment => text().withLength(min: 1, max: 30)();
  DateTimeColumn get date => dateTime()();
}

class Weights extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weight => real()();
  DateTimeColumn get date => dateTime()();}

@DataClassName("Activity")
class Activities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 30)();
  TextColumn get type => text().withLength(min: 1, max: 15)();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get timeIni => dateTime()();
  DateTimeColumn get timeEnd => dateTime()();
  TextColumn get note => text().withLength(min: 0, max: 150)();
}

@UseMoor(
    tables: [Glucoses, Insulins, Weights, Activities],
    daos: [GlucoseDao, InsulinDao, WeightDao, ActivityDao])
class DiabetesDatabase extends _$DiabetesDatabase {
  DiabetesDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Glucoses])
class GlucoseDao extends DatabaseAccessor<DiabetesDatabase>
    with _$GlucoseDaoMixin {
  final DiabetesDatabase db;

  GlucoseDao(this.db) : super(db);

  /// Devuelve todas las glucosas.
  /// Si 'isAsc' es true, ordena por fecha más antígua a más nueva.
  /// De otro modo ordena por fechas más nuevas a más antiguas.
  /// Las horas siempre son de menor a mayor.
  Future<List<Glucose>> getAll(bool isAsc) =>
      (select(glucoses)..orderBy(_getOrderBy(isAsc))).get();

  /// Devuelve todas las glucosas como Stream.
  Stream<List<Glucose>> watchAll(bool isAsc) =>
      (select(glucoses)..orderBy(_getOrderBy(isAsc))).watch();

  /// Devuelve las glucoses entre las dos fechas dadas. Las horas son 00:00 para
  /// el 'dmin' y 23:59 para dmax.
  /// dmin : fecha mínima inclusiva
  /// dmax : fecha máxima inclusiva
  /// isAsc : si es true, se ordena ascendente, de otro modo descendente
  Stream<List<Glucose>> watchByDateSpan(
          DateTime dmin, DateTime dmax, bool isAsc) =>
      (select(glucoses)
            ..where((tbl) =>
                tbl.date.isBiggerOrEqualValue(dmin) &
                tbl.date.isSmallerOrEqualValue(dmax))
            ..orderBy(_getOrderBy(isAsc)))
          .watch();

  /// Devuelve las glucosas por momentos del día
  /// Siempre ordena ascendente
  Stream<List<Glucose>> watchByMoment(DayMoments moment) {
    switch (moment) {
      case DayMoments.MANANA:
        return (select(glucoses)
              ..where((tbl) => tbl.moment.isIn(
                  [momentList[0], momentList[1], momentList[2], momentList[3]]))
              ..orderBy(_getOrderBy(true)))
            .watch();
      case DayMoments.TARDE:
        return (select(glucoses)
              ..where((tbl) => tbl.moment
                  .isIn([momentList[5], momentList[6], momentList[7]]))
              ..orderBy(_getOrderBy(true)))
            .watch();
      case DayMoments.NOCHE:
        return (select(glucoses)
              ..where((tbl) => tbl.moment.isIn([momentList[8], momentList[9]]))
              ..orderBy(_getOrderBy(true)))
            .watch();
    }
  }

  /// Devuelve todas las glucosas hasta el nivel [level].
  Future<List<Glucose>> getByMaxLevel(int level) {
    return (select(glucoses)
          ..where((tbl) => tbl.level.isSmallerOrEqualValue(level))
          ..orderBy(_getOrderBy(true)))
        .get();
  }

  Future insertThis(Insertable<Glucose> glucose) =>
      into(glucoses).insert(glucose);

  Future updateThis(Insertable<Glucose> glucose) =>
      update(glucoses).replace(glucose);

  Future deleteThis(Insertable<Glucose> glucose) =>
      delete(glucoses).delete(glucose);

  // ordena por fecha descendente y por hora ascendente
  List<OrderClauseGenerator<$GlucosesTable>> _getOrderBy(bool isAsc) {
    if (isAsc) {
      return [(t) => OrderingTerm(expression: t.date)];
    }
    return [
      (t) => OrderingTerm(expression: t.date.year, mode: OrderingMode.desc),
      (t) => OrderingTerm(expression: t.date.month, mode: OrderingMode.desc),
      (t) => OrderingTerm(expression: t.date.day, mode: OrderingMode.desc),
      (t) => OrderingTerm(expression: t.date.hour, mode: OrderingMode.asc),
      (t) => OrderingTerm(expression: t.date.minute, mode: OrderingMode.asc)
    ];
  }
}

@UseDao(tables: [Insulins])
class InsulinDao extends DatabaseAccessor<DiabetesDatabase>
    with _$InsulinDaoMixin {
  final DiabetesDatabase db;

  InsulinDao(this.db) : super(db);

  Future<List<Insulin>> getAll() =>
      (select(insulins)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .get();

  Stream<List<Insulin>> watchAll() =>
      (select(insulins)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .watch();

  Future insertThis(Insertable<Insulin> insulin) =>
      into(insulins).insert(insulin);

  Future updateThis(Insertable<Insulin> insulin) =>
      update(insulins).replace(insulin);

  Future deleteThis(Insertable<Insulin> insulin) =>
      delete(insulins).delete(insulin);
}

@UseDao(tables: [Weights])
class WeightDao extends DatabaseAccessor<DiabetesDatabase>
    with _$WeightDaoMixin {
  final DiabetesDatabase db;

  WeightDao(this.db) : super(db);

  Future<List<Weight>> getAll() =>
      (select(weights)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .get();

  Stream<List<Weight>> watchAll() =>
      (select(weights)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .watch();

  Future insertThis(Insertable<Weight> weight) => into(weights).insert(weight);

  Future updateThis(Insertable<Weight> weight) =>
      update(weights).replace(weight);

  Future deleteThis(Insertable<Weight> weight) =>
      delete(weights).delete(weight);
}

@UseDao(tables: [Activities])
class ActivityDao extends DatabaseAccessor<DiabetesDatabase>
    with _$ActivityDaoMixin {
  final DiabetesDatabase db;

  ActivityDao(this.db) : super(db);

  Future<List<Activity>> getAll() =>
      (select(activities)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .get();

  Stream<List<Activity>> watchAll() =>
      (select(activities)..orderBy([(t) => OrderingTerm(expression: t.date)]))
          .watch();

  Future insertThis(Insertable<Activity> activity) =>
      into(activities).insert(activity);

  Future updateThis(Insertable<Activity> activity) =>
      update(activities).replace(activity);

  Future deleteThis(Insertable<Activity> activity) =>
      delete(activities).delete(activity);
}
