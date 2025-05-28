import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:camera/camera.dart';

import 'package:block_flow/features/camera/camera.dart';
import 'package:block_flow/services/services.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final CameraService _cameraService = CameraServiceImpl();
  final MediaStoreService _mediaStoreService = MediaStoreServiceImpl();
  final RecordingTimerService _timerService = RecordingTimerServiceImpl();

  bool _isInitialized = false;


  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final success = await _cameraService.initialize();
    if (success) {
      setState(() => _isInitialized = true);
    }
  }

  Future<void> _switchCamera() async {
    await _cameraService.switchCamera();
    setState(() {});
  }

  Future<void> _takeContent() async {
    final cubit = context.read<CameraCubit>();
    final state = cubit.state;

    if (state.cameraMode == CameraMode.photo) {
      await _takePhoto();
    } else {
      await _recordVideo();
    }
  }

  Future<void> _takePhoto() async {
    final cubit = context.read<CameraCubit>();
    final file = await _cameraService.takePhoto();

    if (file == null) return;

    await cubit.showFlashOverlayOnce();
    await _mediaStoreService.saveImage(File(file.path));
  }

  Future<void> _recordVideo() async {
    final cubit = context.read<CameraCubit>();
    final isRecording = cubit.state.isRecording;

    if (isRecording) {
      final file = await _cameraService.stopVideoRecording();
      if (file != null) {
        _timerService.stop();
        cubit.setIsRecording(false);
        await _mediaStoreService.saveVideo(File(file.path));
      }
    } else {
      await _cameraService.startVideoRecording();
      _timerService.start(onTick: cubit.updateRecordingDuration);
      cubit.setIsRecording(true);
    }
  }

  @override
  void dispose() {
    _cameraService.controller?.dispose();
    _timerService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraCubit, CameraState>(
      builder: (context, state) {
        final controller = _cameraService.controller;

        if (!_isInitialized || controller == null || !controller.value.isInitialized) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 100,
            title: Container(
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                'Camera test task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(child: CameraPreview(controller)),
              if (state.showFlashOverlay)
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: state.showFlashOverlay ? 0.4 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(color: Colors.white),
                  ),
                ),
              if (state.selectedOverlay != null)
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.memory(
                      state.selectedOverlay!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Positioned(
                top: 16,
                right: 16,
                child: RecordingTimer(duration: state.recordingDuration),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (!state.isRecording)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Symbols.forward, size: 32),
                                onPressed: _switchCamera,
                                color: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  state.selectedOverlay == null
                                      ? Icons.add_circle_outline_outlined
                                      : Icons.remove_circle_outline_outlined,
                                  size: 32,
                                ),
                                onPressed: context.read<CameraCubit>().pickOverlay,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      Align(
                        child: RecordButton(
                          isRecording: state.isRecording,
                          isPhotoMode: state.cameraMode == CameraMode.photo,
                          onTap: _takeContent,
                          key: ValueKey(state.isRecording),
                        ),
                      ),
                      if (!state.isRecording)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: IconButton(
                              icon: Icon(
                                state.cameraMode == CameraMode.photo
                                    ? Icons.videocam
                                    : Icons.image_outlined,
                                size: 32,
                              ),
                              onPressed: context.read<CameraCubit>().changeMode,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
