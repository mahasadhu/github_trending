import 'package:get_it/get_it.dart';
import 'package:data/data.dart' as data;
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final diInstance = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  init(diInstance);
  data.configureDependencies(diInstance);
}