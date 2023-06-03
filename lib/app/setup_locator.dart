import 'package:base/global/environment.dart';
import 'package:base/network_module/http_auth.dart';
import 'package:base/network_module/http_base.dart';
import 'package:base/pages/home/repositories/home_repo.dart';
import 'package:get_it/get_it.dart';

export 'setup_locator.dart';

Future<void> setupLocator() async {
  getIt.registerSingleton(HttpAuth());
  getIt.registerSingleton(HttpBase());
  getIt.registerSingleton(HomeRepository());
}

Future<void> updateLocator() async {
  getIt<HttpAuth>().setBaseUrl(Environment.authUrl);
  getIt<HttpBase>().setBaseUrl(Environment.baseUrl);
}

// ignore: prefer_typing_uninitialized_variables
late final GetIt getIt;
