import 'package:ecommerce_ui/core/view_model/home_view_model/home_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
}
