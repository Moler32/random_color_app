import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_app/core/di/injection.dart';
import 'package:random_color_app/core/generated/translations/locale_keys.g.dart';
import 'package:random_color_app/src/cubit/home_page_cubit/home_page_cubit.dart';
import 'package:random_color_app/src/ui/screens/home_page/widgets/indicators/circular_indicator.dart';

/// Home Page body
class HomePageBody extends StatefulWidget {
  /// Home Page body constructor
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final HomePageCubit _homePageCubit = getIt<HomePageCubit>();

  @override
  void dispose() {
    _homePageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      bloc: _homePageCubit,
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            _buildSnackBar(message);
          },
          changedColor: (color) {
            _buildSnackBar(
              LocaleKeys.newColorIs.tr(
                args: [
                  color.toString(),
                ],
              ),
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
      buildWhen: (prev, curr) {
        return curr is Error ||
            curr is Loading ||
            curr is ChangedColor ||
            curr is Initial;
      },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () {
            return _buildBackground();
          },
          changedColor: (color) {
            return _buildBackground(color: color);
          },
          loading: () {
            return const CircularIndicator();
          },
          error: (e) {
            return _buildErrorText(e);
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  Widget _buildBackground({Color? color}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _changeBackgroundColor,
      child: Container(
        color: color,
        child: Center(
          child: Text(
            LocaleKeys.heyThere.tr(),
          ),
        ),
      ),
    );
  }

  void _buildSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget _buildErrorText(String error) {
    return Center(
      child: Text(error),
    );
  }

  void _changeBackgroundColor() {
    _homePageCubit.changeColor();
  }
}
