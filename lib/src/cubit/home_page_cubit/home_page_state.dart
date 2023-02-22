part of 'home_page_cubit.dart';

///States for Home Page
@freezed
class HomePageState with _$HomePageState {
  ///Initial state Home Page
  const factory HomePageState.initial() = Initial;

  ///State to change color Home Page
  const factory HomePageState.changedColor(Color color) = ChangedColor;

  ///State to loading Home Page
  const factory HomePageState.loading() = Loading;

  ///State to error Home Page
  const factory HomePageState.error(String message) = Error;
}
