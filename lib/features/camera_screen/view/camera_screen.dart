import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:camera/camera.dart';

import 'package:block_flow/features/camera_screen/bloc/camera_screen_cubit.dart';
import '../widgets/widgets.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraScreenCubit, CameraScreenState>(
      builder: (context, state) {
        if (state.controller == null || !state.controller!.value.isInitialized) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 100,
            title: Container(
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                'Camera test task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(child: CameraPreview(state.controller!)),
              if (state.selectedOverlay != null)
                Positioned.fill(
                  child: Opacity(opacity: 0.2, child: Image.memory(state.selectedOverlay!, fit: BoxFit.cover)),
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
                                onPressed: context.read<CameraScreenCubit>().switchCamera,
                                color: Colors.white,
                              ),
                              IconButton(
                                icon: Icon(
                                  state.selectedOverlay == null
                                      ? Icons.add_circle_outline_outlined
                                      : Icons.remove_circle_outline_outlined,
                                  size: 32,
                                ),
                                onPressed: context.read<CameraScreenCubit>().pickOverlay,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      Align(
                        child: RecordButton(
                          isRecording: state.isRecording,
                          isPhotoMode: state.cameraMode == CameraMode.photo,
                          onTap: context.read<CameraScreenCubit>().takeContent,
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
                                state.cameraMode == CameraMode.photo ? Icons.videocam : Icons.image_outlined,
                                size: 32,
                              ),
                              onPressed: context.read<CameraScreenCubit>().changeMode,
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
