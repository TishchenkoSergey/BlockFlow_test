import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:block_flow/services/services.dart';

part 'camera_state.dart';

part 'camera_cubit.freezed.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit(
    this._pickImageService,
    this._mediaStoreService,
    this._timerService,
  ) : super(const CameraState());

  final MediaStoreService _mediaStoreService;

  final RecordingTimerService _timerService;

  final PickImageService _pickImageService;

  void setIsRecording(bool isRecording) {
    emit(
      state.copyWith(
        isRecording: isRecording,
        recordingDuration: isRecording ? state.recordingDuration : Duration.zero,
      ),
    );
  }

  void updateRecordingDuration(Duration duration) {
    emit(state.copyWith(recordingDuration: duration));
  }

  Future<void> showFlashOverlayOnce() async {
    emit(state.copyWith(showFlashOverlay: true));

    await Future<void>.delayed(const Duration(milliseconds: 200));

    emit(state.copyWith(showFlashOverlay: false));
  }

  void changeMode() {
    final nextMode = state.cameraMode == CameraMode.photo ? CameraMode.video : CameraMode.photo;
    emit(state.copyWith(cameraMode: nextMode));
  }

  Future<void> pickOverlay() async {
    if (state.selectedOverlay == null) {
      final overlay = await _pickImageService.selectImage();
      if (overlay != null) {
        emit(state.copyWith(selectedOverlay: overlay));
      }
    } else {
      emit(state.copyWith(selectedOverlay: null));
    }
  }

  Future<void> stopVideoRecording(String path) async {
    _timerService.stop();
    setIsRecording(false);
    await _mediaStoreService.saveVideo(File(path));
  }

  Future<void> startVideoRecording() async {
    _timerService.start(onTick: updateRecordingDuration);
    setIsRecording(true);
  }

  Future<void> saveOverlay(String path) async {
    await showFlashOverlayOnce();
    await _mediaStoreService.saveImage(File(path));
  }

  @override
  Future<void> close() {
    _timerService.stop();
    return super.close();
  }
}
