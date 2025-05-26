enum Routes {
  cameraScreen('camera-screen');

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}
