import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:random_color_app/core/generated/translations/locale_keys.g.dart';
import 'package:random_color_app/src/ui/screens/home_page/widgets/app_bar/home_page_app_bar.dart';
import 'package:random_color_app/src/ui/screens/home_page/widgets/body/home_page_body.dart';

/// Home Page
class HomePage extends StatelessWidget {
  /// Home Page constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        title: LocaleKeys.randomColor.tr(),
      ),
      body: const HomePageBody(),
    );
  }
}
