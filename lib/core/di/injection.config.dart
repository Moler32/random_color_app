// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:random_color_app/src/cubit/home_page_cubit/home_page_cubit.dart'
    as _i4;
import 'package:random_color_app/src/repositories/home_page/home_page_repositories.dart'
    as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HomePageRepositories>(
      () => _i3.HomePageRepositoriesImpl());
  gh.factory<_i4.HomePageCubit>(
      () => _i4.HomePageCubit(gh<_i3.HomePageRepositories>()));
  return getIt;
}
