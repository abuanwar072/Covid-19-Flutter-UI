// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistic _$StatisticFromJson(Map<String, dynamic> json) {
  return Statistic()
    ..get = json['get'] as String
    ..parameters = (json['parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..errors = (json['errors'] as List)?.map((e) => e as String)?.toList()
    ..results = json['results'] as int
    ..response = (json['response'] as List)
        ?.map((e) =>
            e == null ? null : Response.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response()
    ..country = json['country'] as String
    ..cases = json['cases'] == null
        ? null
        : Cases.fromJson(json['cases'] as Map<String, dynamic>)
    ..deaths = json['deaths'] == null
        ? null
        : Deaths.fromJson(json['deaths'] as Map<String, dynamic>)
    ..test = json['test'] == null
        ? null
        : Tests.fromJson(json['test'] as Map<String, dynamic>)
    ..time =
        json['time'] == null ? null : DateTime.parse(json['time'] as String);
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'test': instance.test,
      'time': instance.time?.toIso8601String(),
    };

Cases _$CasesFromJson(Map<String, dynamic> json) {
  return Cases()
    ..newCase = json['new'] as String
    ..active = json['active'] as int
    ..critical = json['critical'] as int
    ..recovered = json['recovered'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$CasesToJson(Cases instance) => <String, dynamic>{
      'new': instance.newCase,
      'active': instance.active,
      'critical': instance.critical,
      'recovered': instance.recovered,
      'total': instance.total,
    };

Deaths _$DeathsFromJson(Map<String, dynamic> json) {
  return Deaths()
    ..newCase = json['new'] as String
    ..total = json['total'] as int;
}

Map<String, dynamic> _$DeathsToJson(Deaths instance) => <String, dynamic>{
      'new': instance.newCase,
      'total': instance.total,
    };

Tests _$TestsFromJson(Map<String, dynamic> json) {
  return Tests()..total = json['total'] as int;
}

Map<String, dynamic> _$TestsToJson(Tests instance) => <String, dynamic>{
      'total': instance.total,
    };

Countries _$CountriesFromJson(Map<String, dynamic> json) {
  return Countries()
    ..get = json['get'] as String
    ..parameters =
        (json['parameters'] as List)?.map((e) => e as String)?.toList()
    ..errors = (json['errors'] as List)?.map((e) => e as String)?.toList()
    ..results = json['results'] as int
    ..response = (json['response'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'get': instance.get,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };
