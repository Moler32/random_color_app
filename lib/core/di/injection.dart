import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:random_color_app/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(asExtension: false)
GetIt configureDependencies() => init(getIt);
