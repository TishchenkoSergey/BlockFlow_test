import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';

import 'package:block_flow/services/services.dart';

part 'camera_state.dart';

part 'camera_cubit.freezed.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit(
    this._pickImageService,
    this._mediaStoreService,
    this._timerService,
    this._cameraService,
  ) : super(const CameraState()) {
    _init();
  }

  final PickImageService _pickImageService;
  final MediaStoreService _mediaStoreService;
  final RecordingTimerService _timerService;
  final CameraService _cameraService;

  Future<void> _init() async {
    final success = await _cameraService.initialize();
    if (!success) return;

    emit(
      state.copyWith(
        cameras: _cameraService.cameras,
        selectedCameraIndex: _cameraService.selectedCameraIndex,
        controller: _cameraService.controller,
      ),
    );
  }

  Future<void> switchCamera() async {
    await _cameraService.switchCamera();
    emit(
      state.copyWith(
        selectedCameraIndex: _cameraService.selectedCameraIndex,
        controller: _cameraService.controller,
      ),
    );
  }

  Future<void> pickOverlay() async {
    if (state.selectedOverlay == null) {
      final image = await _pickImageService.selectImage();
      if (image != null) {
        emit(state.copyWith(selectedOverlay: image));
      }
    } else {
      emit(state.copyWith(selectedOverlay: null));
    }
  }

  Future<void> changeMode() async {
    emit(state.copyWith(cameraMode: state.cameraMode == CameraMode.photo ? CameraMode.video : CameraMode.photo));
  }

  Future<void> takeContent() async {
    if (state.cameraMode == CameraMode.photo) {
      await _takePhoto();
    } else {
      await _recordVideo();
    }
  }

  Future<void> _takePhoto() async {
    final file = await _cameraService.takePhoto();
    if (file == null) return;

    emit(state.copyWith(showFlashOverlay: true));

    await _mediaStoreService.saveImage(File(file.path));

    _timerService.delayEffect(
      onDone: () {
        emit(state.copyWith(showFlashOverlay: false));
      },
    );
  }

  Future<void> _recordVideo() async {
    if (state.isRecording) {
      final file = await _cameraService.stopVideoRecording();
      if (file == null) return;

      _timerService.stop();
      emit(state.copyWith(isRecording: false, recordingDuration: Duration.zero));
      await _mediaStoreService.saveVideo(File(file.path));
    } else {
      await _cameraService.startVideoRecording();
      _timerService.start(
        onTick: (duration) {
          emit(state.copyWith(recordingDuration: duration));
        },
      );
      emit(state.copyWith(isRecording: true));
    }
  }
}
