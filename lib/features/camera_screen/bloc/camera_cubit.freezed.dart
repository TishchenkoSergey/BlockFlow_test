// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraState {

 List<CameraDescription> get cameras; int get selectedCameraIndex; bool get isRecording; CameraMode get cameraMode; Duration get recordingDuration; bool get showFlashOverlay; Uint8List? get selectedOverlay; CameraController? get controller;
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateCopyWith<CameraState> get copyWith => _$CameraStateCopyWithImpl<CameraState>(this as CameraState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState&&const DeepCollectionEquality().equals(other.cameras, cameras)&&(identical(other.selectedCameraIndex, selectedCameraIndex) || other.selectedCameraIndex == selectedCameraIndex)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&(identical(other.cameraMode, cameraMode) || other.cameraMode == cameraMode)&&(identical(other.recordingDuration, recordingDuration) || other.recordingDuration == recordingDuration)&&(identical(other.showFlashOverlay, showFlashOverlay) || other.showFlashOverlay == showFlashOverlay)&&const DeepCollectionEquality().equals(other.selectedOverlay, selectedOverlay)&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cameras),selectedCameraIndex,isRecording,cameraMode,recordingDuration,showFlashOverlay,const DeepCollectionEquality().hash(selectedOverlay),controller);

@override
String toString() {
  return 'CameraState(cameras: $cameras, selectedCameraIndex: $selectedCameraIndex, isRecording: $isRecording, cameraMode: $cameraMode, recordingDuration: $recordingDuration, showFlashOverlay: $showFlashOverlay, selectedOverlay: $selectedOverlay, controller: $controller)';
}


}

/// @nodoc
abstract mixin class $CameraStateCopyWith<$Res>  {
  factory $CameraStateCopyWith(CameraState value, $Res Function(CameraState) _then) = _$CameraStateCopyWithImpl;
@useResult
$Res call({
 List<CameraDescription> cameras, int selectedCameraIndex, bool isRecording, CameraMode cameraMode, Duration recordingDuration, bool showFlashOverlay, Uint8List? selectedOverlay, CameraController? controller
});




}
/// @nodoc
class _$CameraStateCopyWithImpl<$Res>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._self, this._then);

  final CameraState _self;
  final $Res Function(CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameras = null,Object? selectedCameraIndex = null,Object? isRecording = null,Object? cameraMode = null,Object? recordingDuration = null,Object? showFlashOverlay = null,Object? selectedOverlay = freezed,Object? controller = freezed,}) {
  return _then(_self.copyWith(
cameras: null == cameras ? _self.cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCameraIndex: null == selectedCameraIndex ? _self.selectedCameraIndex : selectedCameraIndex // ignore: cast_nullable_to_non_nullable
as int,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,cameraMode: null == cameraMode ? _self.cameraMode : cameraMode // ignore: cast_nullable_to_non_nullable
as CameraMode,recordingDuration: null == recordingDuration ? _self.recordingDuration : recordingDuration // ignore: cast_nullable_to_non_nullable
as Duration,showFlashOverlay: null == showFlashOverlay ? _self.showFlashOverlay : showFlashOverlay // ignore: cast_nullable_to_non_nullable
as bool,selectedOverlay: freezed == selectedOverlay ? _self.selectedOverlay : selectedOverlay // ignore: cast_nullable_to_non_nullable
as Uint8List?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController?,
  ));
}

}


/// @nodoc


class _CameraState extends CameraState {
  const _CameraState({final  List<CameraDescription> cameras = const [], this.selectedCameraIndex = 0, this.isRecording = false, this.cameraMode = CameraMode.video, this.recordingDuration = Duration.zero, this.showFlashOverlay = false, this.selectedOverlay, this.controller}): _cameras = cameras,super._();
  

 final  List<CameraDescription> _cameras;
@override@JsonKey() List<CameraDescription> get cameras {
  if (_cameras is EqualUnmodifiableListView) return _cameras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cameras);
}

@override@JsonKey() final  int selectedCameraIndex;
@override@JsonKey() final  bool isRecording;
@override@JsonKey() final  CameraMode cameraMode;
@override@JsonKey() final  Duration recordingDuration;
@override@JsonKey() final  bool showFlashOverlay;
@override final  Uint8List? selectedOverlay;
@override final  CameraController? controller;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraStateCopyWith<_CameraState> get copyWith => __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraState&&const DeepCollectionEquality().equals(other._cameras, _cameras)&&(identical(other.selectedCameraIndex, selectedCameraIndex) || other.selectedCameraIndex == selectedCameraIndex)&&(identical(other.isRecording, isRecording) || other.isRecording == isRecording)&&(identical(other.cameraMode, cameraMode) || other.cameraMode == cameraMode)&&(identical(other.recordingDuration, recordingDuration) || other.recordingDuration == recordingDuration)&&(identical(other.showFlashOverlay, showFlashOverlay) || other.showFlashOverlay == showFlashOverlay)&&const DeepCollectionEquality().equals(other.selectedOverlay, selectedOverlay)&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cameras),selectedCameraIndex,isRecording,cameraMode,recordingDuration,showFlashOverlay,const DeepCollectionEquality().hash(selectedOverlay),controller);

@override
String toString() {
  return 'CameraState(cameras: $cameras, selectedCameraIndex: $selectedCameraIndex, isRecording: $isRecording, cameraMode: $cameraMode, recordingDuration: $recordingDuration, showFlashOverlay: $showFlashOverlay, selectedOverlay: $selectedOverlay, controller: $controller)';
}


}

/// @nodoc
abstract mixin class _$CameraStateCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(_CameraState value, $Res Function(_CameraState) _then) = __$CameraStateCopyWithImpl;
@override @useResult
$Res call({
 List<CameraDescription> cameras, int selectedCameraIndex, bool isRecording, CameraMode cameraMode, Duration recordingDuration, bool showFlashOverlay, Uint8List? selectedOverlay, CameraController? controller
});




}
/// @nodoc
class __$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(this._self, this._then);

  final _CameraState _self;
  final $Res Function(_CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameras = null,Object? selectedCameraIndex = null,Object? isRecording = null,Object? cameraMode = null,Object? recordingDuration = null,Object? showFlashOverlay = null,Object? selectedOverlay = freezed,Object? controller = freezed,}) {
  return _then(_CameraState(
cameras: null == cameras ? _self._cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCameraIndex: null == selectedCameraIndex ? _self.selectedCameraIndex : selectedCameraIndex // ignore: cast_nullable_to_non_nullable
as int,isRecording: null == isRecording ? _self.isRecording : isRecording // ignore: cast_nullable_to_non_nullable
as bool,cameraMode: null == cameraMode ? _self.cameraMode : cameraMode // ignore: cast_nullable_to_non_nullable
as CameraMode,recordingDuration: null == recordingDuration ? _self.recordingDuration : recordingDuration // ignore: cast_nullable_to_non_nullable
as Duration,showFlashOverlay: null == showFlashOverlay ? _self.showFlashOverlay : showFlashOverlay // ignore: cast_nullable_to_non_nullable
as bool,selectedOverlay: freezed == selectedOverlay ? _self.selectedOverlay : selectedOverlay // ignore: cast_nullable_to_non_nullable
as Uint8List?,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController?,
  ));
}


}

// dart format on
