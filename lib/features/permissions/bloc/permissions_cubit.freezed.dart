// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionsState {

 MediaPermissionStatus get mediaPermissionStatus;
/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsStateCopyWith<PermissionsState> get copyWith => _$PermissionsStateCopyWithImpl<PermissionsState>(this as PermissionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionsState&&(identical(other.mediaPermissionStatus, mediaPermissionStatus) || other.mediaPermissionStatus == mediaPermissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,mediaPermissionStatus);

@override
String toString() {
  return 'PermissionsState(mediaPermissionStatus: $mediaPermissionStatus)';
}


}

/// @nodoc
abstract mixin class $PermissionsStateCopyWith<$Res>  {
  factory $PermissionsStateCopyWith(PermissionsState value, $Res Function(PermissionsState) _then) = _$PermissionsStateCopyWithImpl;
@useResult
$Res call({
 MediaPermissionStatus mediaPermissionStatus
});




}
/// @nodoc
class _$PermissionsStateCopyWithImpl<$Res>
    implements $PermissionsStateCopyWith<$Res> {
  _$PermissionsStateCopyWithImpl(this._self, this._then);

  final PermissionsState _self;
  final $Res Function(PermissionsState) _then;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mediaPermissionStatus = null,}) {
  return _then(_self.copyWith(
mediaPermissionStatus: null == mediaPermissionStatus ? _self.mediaPermissionStatus : mediaPermissionStatus // ignore: cast_nullable_to_non_nullable
as MediaPermissionStatus,
  ));
}

}


/// @nodoc


class _Initial implements PermissionsState {
  const _Initial({required this.mediaPermissionStatus});
  

@override final  MediaPermissionStatus mediaPermissionStatus;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.mediaPermissionStatus, mediaPermissionStatus) || other.mediaPermissionStatus == mediaPermissionStatus));
}


@override
int get hashCode => Object.hash(runtimeType,mediaPermissionStatus);

@override
String toString() {
  return 'PermissionsState(mediaPermissionStatus: $mediaPermissionStatus)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $PermissionsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 MediaPermissionStatus mediaPermissionStatus
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mediaPermissionStatus = null,}) {
  return _then(_Initial(
mediaPermissionStatus: null == mediaPermissionStatus ? _self.mediaPermissionStatus : mediaPermissionStatus // ignore: cast_nullable_to_non_nullable
as MediaPermissionStatus,
  ));
}


}

// dart format on
