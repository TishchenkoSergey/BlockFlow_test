import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';

import 'package:block_flow/features/features.dart';

import 'app_route_enum.dart';

class AppRoute {
  GoRouter build(BuildContext context) {
    return GoRouter(
      routes: [
        _buildMainPage(),
      ],
      initialLocation: '/${Routes.mainScreen.name}',
    );
  }

  GoRoute _buildMainPage() {
    return GoRoute(
      name: Routes.mainScreen.name,
      path: '/${Routes.mainScreen.name}',
      pageBuilder: (context, state) => const CupertinoPage(
        child:  CameraScreen(),
      ),
    );
  }
}
