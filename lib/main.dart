import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_app/core/constans/locales/app_locales.dart';
import 'package:random_color_app/core/di/injection.dart';
import 'package:random_color_app/core/generated/translations/codegen_loader.g.dart';
import 'package:random_color_app/random_color_app.dart';
import 'package:random_color_app/src/cubit/home_page_cubit/home_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocales.appLocales,
      path: 'assets/translations',
      fallbackLocale: AppLocales.enLocale,
      assetLoader: const CodegenLoader(),
      child: BlocProvider<HomePageCubit>(
        create: (context) => getIt<HomePageCubit>(),
        child: const RandomColorApp(),
      ),
    ),
  );
}
