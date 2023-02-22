import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class HomePageRepositories {
  Color changeColor();
}

@LazySingleton(as: HomePageRepositories)
class HomePageRepositoriesImpl extends HomePageRepositories {
  static const colorValue = 0x100000000;
  final Random _random = Random();

  @override
  Color changeColor() {
    final color = Color(_random.nextInt(colorValue));
    return color;
  }
}
