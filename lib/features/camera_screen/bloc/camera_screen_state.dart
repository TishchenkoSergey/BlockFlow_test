part of 'camera_screen_cubit.dart';

enum CameraMode {
  photo,
  video,
}

@freezed
sealed class CameraScreenState with _$CameraScreenState {
  const factory CameraScreenState({
    @Default([]) List<CameraDescription> cameras,
    @Default(0) int selectedCameraIndex,
    @Default(false) bool isRecording,
    @Default(CameraMode.video) CameraMode cameraMode,
    @Default(Duration.zero) Duration recordingDuration,
    Uint8List? selectedOverlay,
    CameraController? controller,
  }) = _CameraScreenState;

  const CameraScreenState._();
}
