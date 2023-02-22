import 'package:flutter/material.dart';
import 'package:random_color_app/core/constans/theme/colors/app_colors.dart';
import 'package:random_color_app/core/constans/theme/sizes/app_sizes.dart';

///App Bar for Home Page
class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// App bar title
  final String? title;

  /// App bar height
  final double height;
  @override
  final Size preferredSize;

  /// Home Page App Bar constructor
  HomePageAppBar({
    super.key,
    this.title,
    this.height = AppSizes.height,
  }) : preferredSize = Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      backgroundColor: AppColors.homeAppBar,
    );
  }
}
