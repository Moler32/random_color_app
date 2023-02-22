part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = Initial;
  const factory HomePageState.changedColor(Color color) = ChangedColor;
  const factory HomePageState.loading() = Loading;
  const factory HomePageState.error(String message) = Error;
}
