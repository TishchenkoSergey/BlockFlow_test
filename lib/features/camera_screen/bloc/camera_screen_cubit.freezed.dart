// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraScreenState {

 List<CameraDescription> get cameras; int get selectedCameraIndex; bool get isRecording; Uint8List? get selectedOverlay; CameraController? get controller;
/// Create a copy of CameraScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraScreenStateCopyWith<CameraScreenState> get copyWith => _$CameraScreenStateCopyWithImpl<CameraScreenState>(this as CameraScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraScreenState&&const DeepCollectionEquality().equals(other.cameras, cameras)&&(identical(other.selectedCameraIndex, selectedCameraIndex) || other.selectedCameraIndex == selectedCameraIndex)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&const DeepCollectionEquality().equals(other.selectedOverlay, selectedOverlay)&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cameras),selectedCameraIndex,isRecording,const DeepCollectionEquality().hash(selectedOverlay),controller);

@override
String toString() {
  return 'CameraScreenState(cameras: $cameras, selectedCameraIndex: $selectedCameraIndex, isRecording: $isRecording, selectedOverlay: $selectedOverlay, controller: $controller)';
}


}

/// @nodoc
abstract mixin class $CameraScreenStateCopyWith<$Res>  {
  factory $CameraScreenStateCopyWith(CameraScreenState value, $Res Function(CameraScreenState) _then) = _$CameraScreenStateCopyWithImpl;
@useResult
$Res call({
 List<CameraDescription> cameras, int selectedCameraIndex, bool isRecording, Uint8List? selectedOverlay, CameraController? controller
});




}
/// @nodoc
class _$CameraScreenStateCopyWithImpl<$Res>
    implements $CameraScreenStateCopyWith<$Res> {
  _$CameraScreenStateCopyWithImpl(this._self, this._then);

  final CameraScreenState _self;
  final $Res Function(CameraScreenState) _then;

/// Create a copy of CameraScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameras = null,Object? selectedCameraIndex = null,Object? isRecording = null,Object? selectedOverlay = freezed,Object? controller = freezed,}) {
  return _then(_self.copyWith(
cameras: null == cameras ? _self.cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCameraIndex: null == selectedCameraIndex ? _self.selectedCameraIndex : selectedCameraIndex // ignore: cast_nullable_to_non_nullable
as int,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,selectedOverlay: freezed == selectedOverlay ? _self.selectedOverlay : selectedOverlay // ignore: cast_nullable_to_non_nullable
as Uint8List?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController?,
  ));
}

}


/// @nodoc


class _CameraScreenState extends CameraScreenState {
  const _CameraScreenState({final  List<CameraDescription> cameras = const [], this.selectedCameraIndex = 1, this.isRecording = false, this.selectedOverlay, this.controller}): _cameras = cameras,super._();
  

 final  List<CameraDescription> _cameras;
@override@JsonKey() List<CameraDescription> get cameras {
  if (_cameras is EqualUnmodifiableListView) return _cameras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cameras);
}

@override@JsonKey() final  int selectedCameraIndex;
@override@JsonKey() final  bool isRecording;
@override final  Uint8List? selectedOverlay;
@override final  CameraController? controller;

/// Create a copy of CameraScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraScreenStateCopyWith<_CameraScreenState> get copyWith => __$CameraScreenStateCopyWithImpl<_CameraScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraScreenState&&const DeepCollectionEquality().equals(other._cameras, _cameras)&&(identical(other.selectedCameraIndex, selectedCameraIndex) || other.selectedCameraIndex == selectedCameraIndex)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&const DeepCollectionEquality().equals(other.selectedOverlay, selectedOverlay)&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cameras),selectedCameraIndex,isRecording,const DeepCollectionEquality().hash(selectedOverlay),controller);

@override
String toString() {
  return 'CameraScreenState(cameras: $cameras, selectedCameraIndex: $selectedCameraIndex, isRecording: $isRecording, selectedOverlay: $selectedOverlay, controller: $controller)';
}


}

/// @nodoc
abstract mixin class _$CameraScreenStateCopyWith<$Res> implements $CameraScreenStateCopyWith<$Res> {
  factory _$CameraScreenStateCopyWith(_CameraScreenState value, $Res Function(_CameraScreenState) _then) = __$CameraScreenStateCopyWithImpl;
@override @useResult
$Res call({
 List<CameraDescription> cameras, int selectedCameraIndex, bool isRecording, Uint8List? selectedOverlay, CameraController? controller
});




}
/// @nodoc
class __$CameraScreenStateCopyWithImpl<$Res>
    implements _$CameraScreenStateCopyWith<$Res> {
  __$CameraScreenStateCopyWithImpl(this._self, this._then);

  final _CameraScreenState _self;
  final $Res Function(_CameraScreenState) _then;

/// Create a copy of CameraScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameras = null,Object? selectedCameraIndex = null,Object? isRecording = null,Object? selectedOverlay = freezed,Object? controller = freezed,}) {
  return _then(_CameraScreenState(
cameras: null == cameras ? _self._cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCameraIndex: null == selectedCameraIndex ? _self.selectedCameraIndex : selectedCameraIndex // ignore: cast_nullable_to_non_nullable
as int,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,selectedOverlay: freezed == selectedOverlay ? _self.selectedOverlay : selectedOverlay // ignore: cast_nullable_to_non_nullable
as Uint8List?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController?,
  ));
}


}

// dart format on
