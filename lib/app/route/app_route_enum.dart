enum Routes {
  mainScreen('main-screen');

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}
