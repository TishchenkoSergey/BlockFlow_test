part of 'camera_screen_cubit.dart';

@freezed
sealed class CameraScreenState with _$CameraScreenState {
  const factory CameraScreenState({
    @Default([]) List<CameraDescription> cameras,
    @Default(1) int selectedCameraIndex,
    @Default(false) bool isRecording,
    Uint8List? selectedOverlay,
    CameraController? controller,
  }) = _CameraScreenState;

  const CameraScreenState._();
}
