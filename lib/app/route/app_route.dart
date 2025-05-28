import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:block_flow/features/features.dart';
import 'package:block_flow/services/services.dart';

import 'app_route_enum.dart';

class AppRoute {
  AppRoute({required this.serviceLocator});

  final GetIt serviceLocator;

  PermissionsService get permissionsService => serviceLocator.get<PermissionsService>();

  GoRouter build(BuildContext context) {
    return GoRouter(
      refreshListenable: permissionsService,
      routes: [_buildCameraPage(), _buildPermissionPage()],
      initialLocation: '/${Routes.camera.name}',
      redirect: (context, state) {
        if (!permissionsService.mediaPermissionsStatus.isGranted) {
          return '/${Routes.permissions.name}';
        } else {
          return '/${Routes.camera.name}';
        }
      },
    );
  }

  GoRoute _buildCameraPage() {
    return GoRoute(
      name: Routes.camera.name,
      path: '/${Routes.camera.name}',
      pageBuilder:
          (context, state) => CupertinoPage(
            child: BlocProvider(
              create:
                (context) => CameraCubit(
                  serviceLocator.get(),
                  serviceLocator.get(),
                  serviceLocator.get(),
                ),
              child: Camera(cameraUtil: CameraUtil()),
            ),
          ),
    );
  }

  GoRoute _buildPermissionPage() {
    return GoRoute(
      name: Routes.permissions.name,
      path: '/${Routes.permissions.name}',
      pageBuilder:
          (context, state) => CupertinoPage(
            child: BlocProvider(
              create: (context) => PermissionsCubit(serviceLocator.get()),
              child: const PermissionScreen(),
            ),
          ),
    );
  }
}
