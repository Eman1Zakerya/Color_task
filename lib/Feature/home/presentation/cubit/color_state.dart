import 'package:flutter/material.dart';

class ColorState {
  final Color backgroundColor;
  final String? userName;

  const ColorState({
    required this.backgroundColor,
    this.userName,
  });
  ColorState copyWith({
    Color? backgroundColor,
    String? userName,
  }) {
    return ColorState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      userName: userName ?? this.userName,
    );
  }
}