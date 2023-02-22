import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:random_color_app/core/di/injection.config.dart';

///A global variable for GetIt instance
final getIt = GetIt.instance;

@InjectableInit(asExtension: false)

///Top level function
GetIt configureDependencies() => init(getIt);
