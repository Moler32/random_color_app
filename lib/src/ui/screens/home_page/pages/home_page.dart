import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/generated/translations/locale_keys.g.dart';
import '../../../../cubit/home_page_cubit/home_page_cubit.dart';
import '../widgets/app_bar/home_page_app_bar.dart';
import '../widgets/indicators/circular_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageCubit _homePageCubit = getIt<HomePageCubit>();

  @override
  void dispose() {
    _homePageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        title: LocaleKeys.randomColor.tr(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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
