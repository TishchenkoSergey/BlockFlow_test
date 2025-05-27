import 'package:bloc/bloc.dart';
import 'package:block_flow/services/permissions_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permissions_state.dart';

part 'permissions_cubit.freezed.dart';

class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit(this.permissionsService)
    : super(PermissionsState(mediaPermissionStatus: permissionsService.mediaPermissionsStatus));

  final PermissionsService permissionsService;

  Future<void> requestPermissions() async {
    if (permissionsService.mediaPermissionsStatus == MediaPermissionStatus.permanentlyDenied) {
      await permissionsService.openSettings();
    }

    await permissionsService.requestPermissions();

    emit(state.copyWith(mediaPermissionStatus: permissionsService.mediaPermissionsStatus));
  }
}
