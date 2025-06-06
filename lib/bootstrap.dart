import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:block_flow/services/services.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'di/di.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

class BootstrapResult {
  BootstrapResult(this.serviceLocator);

  final GetIt serviceLocator;
}

Future<void> bootstrap(FutureOr<Widget> Function(BootstrapResult result) builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final serviceLocator = await configureDependencies();

  // Initialize services
  final permissionsService = PermissionsService();
  await permissionsService.requestPermissions();

  // Register services in the service locator
  serviceLocator.registerSingleton<PermissionsService>(permissionsService);

  final bootstrapResult = BootstrapResult(serviceLocator);

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(await builder(bootstrapResult));
}
