// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BodyData extends _BodyData
    with RealmEntity, RealmObjectBase, RealmObject {
  BodyData(
    double bodyWeight,
    double bodyFatPercentage,
    DateTime date,
  ) {
    RealmObjectBase.set(this, 'bodyWeight', bodyWeight);
    RealmObjectBase.set(this, 'bodyFatPercentage', bodyFatPercentage);
    RealmObjectBase.set(this, 'date', date);
  }

  BodyData._();

  @override
  double get bodyWeight =>
      RealmObjectBase.get<double>(this, 'bodyWeight') as double;
  @override
  set bodyWeight(double value) =>
      RealmObjectBase.set(this, 'bodyWeight', value);

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
  Stream<RealmObjectChanges<BodyData>> get changes =>
      RealmObjectBase.getChanges<BodyData>(this);

  @override
  Stream<RealmObjectChanges<BodyData>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<BodyData>(this, keyPaths);

  @override
  BodyData freeze() => RealmObjectBase.freezeObject<BodyData>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'bodyWeight': bodyWeight.toEJson(),
      'bodyFatPercentage': bodyFatPercentage.toEJson(),
      'date': date.toEJson(),
    };
  }

  static EJsonValue _toEJson(BodyData value) => value.toEJson();
  static BodyData _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'bodyWeight': EJsonValue bodyWeight,
        'bodyFatPercentage': EJsonValue bodyFatPercentage,
        'date': EJsonValue date,
      } =>
        BodyData(
          fromEJson(bodyWeight),
          fromEJson(bodyFatPercentage),
          fromEJson(date),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(BodyData._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, BodyData, 'BodyData', [
      SchemaProperty('bodyWeight', RealmPropertyType.double),
      SchemaProperty('bodyFatPercentage', RealmPropertyType.double),
      SchemaProperty('date', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
