import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:block_flow/app/route/route.dart';

import '../../features/camera_screen/view/camera_screen.dart';

class App extends StatefulWidget {
  const App({
    required this.serviceLocator,
    super.key,
  });

  final GetIt serviceLocator;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final route = AppRoute(
    serviceLocator: widget.serviceLocator,
  ).build(context);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      home: const CameraScreen(),
    );
  }
}
