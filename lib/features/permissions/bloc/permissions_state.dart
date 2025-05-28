part of 'permissions_cubit.dart';

@freezed
sealed class PermissionsState with _$PermissionsState {
  const factory PermissionsState({required MediaPermissionStatus mediaPermissionStatus}) = _Initial;
}
