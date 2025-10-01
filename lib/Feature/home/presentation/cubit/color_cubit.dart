import 'color_state.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(const ColorState(backgroundColor: Colors.white));

  final random = Random();

  void changeColor() {
    final color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    emit(state.copyWith(backgroundColor: color));
  }

  void setUserName(String name) {
    emit(state.copyWith(userName: name));
  }
}