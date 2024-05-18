// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostBody _$PostBodyFromJson(Map<String, dynamic> json) {
  return _PostBody.fromJson(json);
}

/// @nodoc
mixin _$PostBody {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostBodyCopyWith<PostBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostBodyCopyWith<$Res> {
  factory $PostBodyCopyWith(PostBody value, $Res Function(PostBody) then) =
      _$PostBodyCopyWithImpl<$Res, PostBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName});
}

/// @nodoc
class _$PostBodyCopyWithImpl<$Res, $Val extends PostBody>
    implements $PostBodyCopyWith<$Res> {
  _$PostBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostBodyImplCopyWith<$Res>
    implements $PostBodyCopyWith<$Res> {
  factory _$$PostBodyImplCopyWith(
          _$PostBodyImpl value, $Res Function(_$PostBodyImpl) then) =
      __$$PostBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName});
}

/// @nodoc
class __$$PostBodyImplCopyWithImpl<$Res>
    extends _$PostBodyCopyWithImpl<$Res, _$PostBodyImpl>
    implements _$$PostBodyImplCopyWith<$Res> {
  __$$PostBodyImplCopyWithImpl(
      _$PostBodyImpl _value, $Res Function(_$PostBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$PostBodyImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostBodyImpl implements _PostBody {
  const _$PostBodyImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName});

  factory _$PostBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostBodyImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;

  @override
  String toString() {
    return 'PostBody(email: $email, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostBodyImplCopyWith<_$PostBodyImpl> get copyWith =>
      __$$PostBodyImplCopyWithImpl<_$PostBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostBodyImplToJson(
      this,
    );
  }
}

abstract class _PostBody implements PostBody {
  const factory _PostBody(
      {@JsonKey(name: "email") final String? email,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName}) = _$PostBodyImpl;

  factory _PostBody.fromJson(Map<String, dynamic> json) =
      _$PostBodyImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$PostBodyImplCopyWith<_$PostBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
