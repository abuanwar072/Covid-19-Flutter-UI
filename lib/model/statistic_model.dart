import 'package:json_annotation/json_annotation.dart';

part 'statistic_model.g.dart';

@JsonSerializable(nullable: true)
class Statistic {
  String get;
  Map<String, String> parameters;
  List<String> errors;
  int results;
}

@JsonSerializable(nullable: true)
class Response {
  String country;
  Cases cases;
  Deaths deaths;
  Tests test;
  DateTime time;
}

@JsonSerializable(nullable: true)
class Cases {
  Cases();
  @JsonKey(name: "new")
  String newCase;
  int active;
  int critical;
  int recovered;
  int total;

  factory Cases.fromJson(Map<String, dynamic> json) => _$CasesFromJson(json);
}

@JsonSerializable(nullable: true)
class Deaths {
  Deaths();
  @JsonKey(name: "new")
  String newCase;
  int total;

  factory Deaths.fromJson(Map<String, dynamic> json) => _$DeathsFromJson(json);
}

@JsonSerializable(nullable: true)
class Tests {
  Tests();
  int total;
  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);
}
