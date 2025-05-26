import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:camera/camera.dart';

part 'camera_screen_state.dart';

part 'camera_screen_cubit.freezed.dart';

class CameraScreenCubit extends Cubit<CameraScreenState> {
  CameraScreenCubit() : super(const CameraScreenState());
}
