import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injection.config.dart';

@InjectableInit()
Future<GetIt> configureDependencies() async => GetIt.asNewInstance().init();

@module
abstract class RegisterModule {}
