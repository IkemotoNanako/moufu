// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BodyWeightData extends _BodyWeightData
    with RealmEntity, RealmObjectBase, RealmObject {
  BodyWeightData(
    double bodyWeight,
    DateTime date,
  ) {
    RealmObjectBase.set(this, 'bodyWeight', bodyWeight);
    RealmObjectBase.set(this, 'date', date);
  }

  BodyWeightData._();

  @override
  double get bodyWeight =>
      RealmObjectBase.get<double>(this, 'bodyWeight') as double;
  @override
  set bodyWeight(double value) =>
      RealmObjectBase.set(this, 'bodyWeight', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  Stream<RealmObjectChanges<BodyWeightData>> get changes =>
      RealmObjectBase.getChanges<BodyWeightData>(this);

  @override
  Stream<RealmObjectChanges<BodyWeightData>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<BodyWeightData>(this, keyPaths);

  @override
  BodyWeightData freeze() => RealmObjectBase.freezeObject<BodyWeightData>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'bodyWeight': bodyWeight.toEJson(),
      'date': date.toEJson(),
    };
  }

  static EJsonValue _toEJson(BodyWeightData value) => value.toEJson();
  static BodyWeightData _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'bodyWeight': EJsonValue bodyWeight,
        'date': EJsonValue date,
      } =>
        BodyWeightData(
          fromEJson(bodyWeight),
          fromEJson(date),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(BodyWeightData._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, BodyWeightData, 'BodyWeightData', [
      SchemaProperty('bodyWeight', RealmPropertyType.double),
      SchemaProperty('date', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class BodyFatPercentageData extends _BodyFatPercentageData
    with RealmEntity, RealmObjectBase, RealmObject {
  BodyFatPercentageData(
    double bodyFatPercentage,
    DateTime date,
  ) {
    RealmObjectBase.set(this, 'bodyFatPercentage', bodyFatPercentage);
    RealmObjectBase.set(this, 'date', date);
  }

  BodyFatPercentageData._();

  @override
  double get bodyFatPercentage =>
      RealmObjectBase.get<double>(this, 'bodyFatPercentage') as double;
  @override
  set bodyFatPercentage(double value) =>
      RealmObjectBase.set(this, 'bodyFatPercentage', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  Stream<RealmObjectChanges<BodyFatPercentageData>> get changes =>
      RealmObjectBase.getChanges<BodyFatPercentageData>(this);

  @override
  Stream<RealmObjectChanges<BodyFatPercentageData>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<BodyFatPercentageData>(this, keyPaths);

  @override
  BodyFatPercentageData freeze() =>
      RealmObjectBase.freezeObject<BodyFatPercentageData>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'bodyFatPercentage': bodyFatPercentage.toEJson(),
      'date': date.toEJson(),
    };
  }

  static EJsonValue _toEJson(BodyFatPercentageData value) => value.toEJson();
  static BodyFatPercentageData _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'bodyFatPercentage': EJsonValue bodyFatPercentage,
        'date': EJsonValue date,
      } =>
        BodyFatPercentageData(
          fromEJson(bodyFatPercentage),
          fromEJson(date),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(BodyFatPercentageData._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, BodyFatPercentageData,
        'BodyFatPercentageData', [
      SchemaProperty('bodyFatPercentage', RealmPropertyType.double),
      SchemaProperty('date', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
