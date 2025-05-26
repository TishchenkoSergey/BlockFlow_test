import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:block_flow/features/camera_screen/bloc/camera_screen_cubit.dart';
import 'package:camera/camera.dart';

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
                bottom: 32,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.double_arrow_outlined),
                      onPressed: context.read<CameraScreenCubit>().switchCamera,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(
                        state.selectedOverlay == null
                            ? Icons.add_circle_outline_outlined
                            : Icons.remove_circle_outline_outlined,
                      ),
                      onPressed: context.read<CameraScreenCubit>().pickOverlay,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: Icon(state.isRecording ? Icons.stop : Icons.videocam),
                      onPressed: context.read<CameraScreenCubit>().recordVideo,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.image_outlined),
                      onPressed: context.read<CameraScreenCubit>().takePhoto,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
