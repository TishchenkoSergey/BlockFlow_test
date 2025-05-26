import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:block_flow/services/services.dart';

part 'camera_screen_state.dart';

part 'camera_screen_cubit.freezed.dart';

class CameraScreenCubit extends Cubit<CameraScreenState> {
  CameraScreenCubit(this._pickImageService, this._mediaStoreService)
      : super(const CameraScreenState()) {
    _init();
  }

  final PickImageService _pickImageService;
  final MediaStoreService _mediaStoreService;

  Future<void> _init() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return;

    final cameras = await availableCameras();
    final controller =
    CameraController(cameras[state.selectedCameraIndex], ResolutionPreset.high);

    await controller.initialize();

    emit(state.copyWith(cameras: cameras, controller: controller));
  }

  Future<void> switchCamera() async {
    final selectedIndex = (state.selectedCameraIndex + 1) % state.cameras.length;
    final controller =
    CameraController(state.cameras[selectedIndex], ResolutionPreset.high);

    await controller.initialize();

    emit(state.copyWith(selectedCameraIndex: selectedIndex, controller: controller));
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

  Future<void> takePhoto() async {
    final controller = state.controller;
    if (controller == null || !controller.value.isInitialized) return;

    final file = await controller.takePicture();

    await _mediaStoreService.saveImage(File(file.path));
  }

  Future<void> recordVideo() async {
    final controller = state.controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state.isRecording) {
      final file = await controller.stopVideoRecording();
      emit(state.copyWith(isRecording: false));
      await _mediaStoreService.saveVideo(File(file.path));
    } else {
      await controller.prepareForVideoRecording();
      await controller.startVideoRecording();
      emit(state.copyWith(isRecording: true));
    }
  }
}
