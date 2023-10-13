import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'darklight_state.dart';

class DarklightCubit extends Cubit<DarklightState> {
  DarklightCubit() : super(DarklightInitial());

  switchmode() {
    emit(DarklightInitial());
  }
}
