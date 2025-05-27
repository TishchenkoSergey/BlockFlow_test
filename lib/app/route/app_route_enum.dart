enum Routes {
  camera('camera'),
  permissions('permissions');

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}
