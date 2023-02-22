import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:random_color_app/src/ui/screens/home_page/pages/home_page.dart';

/// application start
class RandomColorApp extends StatelessWidget {
  /// Random Color App constructor
  const RandomColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
