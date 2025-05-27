import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:injectable/injectable.dart';

abstract class CameraService {
  CameraController? get controller;
  List<CameraDescription> get cameras;
  int get selectedCameraIndex;

  Future<bool> initialize();

  Future<void> switchCamera();

  Future<XFile?> takePhoto();

  Future<void> startVideoRecording();

  Future<XFile?> stopVideoRecording();
}

@Injectable(as: CameraService)
class CameraServiceImpl implements CameraService {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;

  @override
  CameraController? get controller => _controller;

  @override
  List<CameraDescription> get cameras => _cameras;

  @override
  int get selectedCameraIndex => _selectedCameraIndex;

  @override
  Future<bool> initialize() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return false;

    _cameras = await availableCameras();
    _selectedCameraIndex = 0;

    _controller = CameraController(
      _cameras[_selectedCameraIndex],
      ResolutionPreset.high,
    );

    await _controller!.initialize();
    return true;
  }

  @override
  Future<void> switchCamera() async {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;

    _controller = CameraController(
      _cameras[_selectedCameraIndex],
      ResolutionPreset.high,
    );

    await _controller!.initialize();
  }

  @override
  Future<XFile?> takePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) return null;
    return _controller!.takePicture();
  }

  @override
  Future<void> startVideoRecording() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();
  }

  @override
  Future<XFile?> stopVideoRecording() async {
    if (_controller == null || !_controller!.value.isInitialized) return null;
    return _controller!.stopVideoRecording();
  }
}
