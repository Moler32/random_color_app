import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

///Abstract class to Home Page Repositories
abstract class HomePageRepositories {
  ///Abstract method to change color
  Color changeColor();
}

///Home Page repository implementation
@LazySingleton(as: HomePageRepositories)
class HomePageRepositoriesImpl extends HomePageRepositories {
  static const _colorValue = 0x100000000;
  final Random _random = Random();

  @override
  Color changeColor() {
    final color = Color(_random.nextInt(_colorValue));

    return color;
  }
}
