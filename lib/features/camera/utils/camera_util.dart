import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraUtil {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;

  CameraController? get controller => _controller;

  List<CameraDescription> get cameras => _cameras;

  int get selectedCameraIndex => _selectedCameraIndex;

  Future<bool> initialize() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) return false;

    _cameras = await availableCameras();
    _selectedCameraIndex = 0;

    _controller = CameraController(_cameras[_selectedCameraIndex], ResolutionPreset.high);

    await _controller!.initialize();
    return true;
  }

  Future<void> switchCamera() async {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;

    _controller = CameraController(_cameras[_selectedCameraIndex], ResolutionPreset.high);

    await _controller!.initialize();
  }

  Future<XFile?> takePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) return null;
    return _controller!.takePicture();
  }

  Future<void> startVideoRecording() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();
  }

  Future<XFile?> stopVideoRecording() async {
    if (_controller == null || !_controller!.value.isInitialized) return null;
    return _controller!.stopVideoRecording();
  }
}
