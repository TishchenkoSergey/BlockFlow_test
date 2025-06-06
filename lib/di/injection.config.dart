// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:block_flow/services/media_store_service.dart' as _i8;
import 'package:block_flow/services/pick_image_service.dart' as _i607;
import 'package:block_flow/services/recording_timer_service.dart' as _i32;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i32.RecordingTimerService>(
      () => _i32.RecordingTimerServiceImpl(),
    );
    gh.factory<_i607.PickImageService>(() => _i607.PickImageServiceImpl());
    gh.factory<_i8.MediaStoreService>(() => _i8.MediaStoreServiceImpl());
    return this;
  }
}
