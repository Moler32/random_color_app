import 'package:flutter/material.dart';
import 'package:random_color_app/core/constans/theme/colors/app_colors.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
    this.title,
  }) : preferredSize = const Size.fromHeight(60);

  final String? title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      backgroundColor: AppColors.homeAppBar,
    );
  }
}
