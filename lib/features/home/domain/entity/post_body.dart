import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_body.freezed.dart';
part 'post_body.g.dart';

@freezed
class PostBody with _$PostBody {
  const factory PostBody({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
  }) = _PostBody;

  factory PostBody.fromJson(Map<String, dynamic> json) => _$PostBodyFromJson(json);
}
