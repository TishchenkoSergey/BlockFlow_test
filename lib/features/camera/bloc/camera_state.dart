part of 'camera_cubit.dart';

enum CameraMode {
  photo,
  video,
}

@freezed
sealed class CameraState with _$CameraState {
  const factory CameraState({
    @Default(0) int selectedCameraIndex,
    @Default(false) bool isRecording,
    @Default(CameraMode.video) CameraMode cameraMode,
    @Default(Duration.zero) Duration recordingDuration,
    @Default(false) bool showFlashOverlay,
    Uint8List? selectedOverlay,
  }) = _CameraState;

  const CameraState._();
}
