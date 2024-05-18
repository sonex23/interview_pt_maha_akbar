import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'home_entity.freezed.dart';
part 'home_entity.g.dart';

@freezed
class HomeEntity with _$HomeEntity {
  const factory HomeEntity({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "per_page") int? perPage,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "data") List<Datum>? data,
    @JsonKey(name: "support") Support? support,
  }) = _HomeEntity;

  factory HomeEntity.fromJson(Map<String, dynamic> json) => _$HomeEntityFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "avatar") String? avatar,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Support with _$Support {
  const factory Support({
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "text") String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
}
