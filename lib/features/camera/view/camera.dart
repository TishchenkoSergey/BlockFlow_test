import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:camera/camera.dart';

import 'package:block_flow/features/camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({
    required this.cameraUtil,
    super.key,
  });

  final CameraUtil cameraUtil;

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  bool _isInitialized = false;

  CameraCubit get _cameraCubit => context.read<CameraCubit>();

  CameraUtil get _cameraUtil => widget.cameraUtil;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraUtil.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraCubit, CameraState>(
      builder: (context, state) {
        final controller = _cameraUtil.controller;

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

  Future<void> _initializeCamera() async {
    final success = await _cameraUtil.initialize();
    if (success) {
      setState(() => _isInitialized = true);
    }
  }

  Future<void> _switchCamera() async {
    await _cameraUtil.switchCamera();
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
    final file = await _cameraUtil.takePhoto();

    if (file == null) return;

    await _cameraCubit.saveOverlay(file.path);
  }

  Future<void> _recordVideo() async {
    final cubit = context.read<CameraCubit>();
    final isRecording = cubit.state.isRecording;

    if (isRecording) {
      final file = await _cameraUtil.stopVideoRecording();
      if (file != null) await _cameraCubit.stopVideoRecording(file.path);
    } else {
      await _cameraUtil.startVideoRecording();
      await _cameraCubit.startVideoRecording();
    }
  }
}
