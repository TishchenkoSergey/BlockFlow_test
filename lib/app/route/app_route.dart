import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:get_it/get_it.dart';

import 'package:block_flow/features/features.dart';

import 'app_route_enum.dart';

class AppRoute {
  AppRoute({
    required this.serviceLocator,
  });

  final GetIt serviceLocator;

  GoRouter build(BuildContext context) {
    return GoRouter(
      routes: [
        _buildMainPage(),
      ],
      initialLocation: '/${Routes.cameraScreen.name}',
    );
  }

  GoRoute _buildMainPage() {
    return GoRoute(
      name: Routes.cameraScreen.name,
      path: '/${Routes.cameraScreen.name}',
      pageBuilder: (context, state) => const CupertinoPage(
        child:  CameraScreen(),
      ),
    );
  }
}
