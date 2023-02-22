import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:random_color_app/src/repositories/home_page/home_page_repositories.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._homePageRepositories)
      : super(const HomePageState.initial());

  final HomePageRepositories _homePageRepositories;

  Future<void> changeColor() async {
    try {
      emit(const HomePageState.loading());
      await Future.delayed(const Duration(milliseconds: 600));
      final color = _homePageRepositories.changeColor();
      emit(HomePageState.changedColor(color));
    } catch (e) {
      emit(HomePageState.error(e.toString()));
    }
  }
}
