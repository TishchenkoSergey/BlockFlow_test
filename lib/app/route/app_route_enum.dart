enum Routes {
  camera('camera');

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}
