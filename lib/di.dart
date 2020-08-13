import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statemanagementsession/data/api_repo.dart';

import 'data/local_repository.dart';
import 'features/cart/cart_provider.dart';
import 'features/products/products_provider.dart';
import 'services/navigation_service.dart';

/// sl: service locator
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ApiRepo>(
    () => ApiRepo(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<LocalRepo>(
    () => LocalRepo(
      sharedPreferences: sl(),
    ),
  );

  Dio client = Dio(
    BaseOptions(
      contentType: 'application/json',
    ),
  );
  sl.registerLazySingleton<Dio>(() => client);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => ProductsProvider());
  sl.registerLazySingleton(() => CartProvider());

  sl.registerLazySingleton(() => NavigationService());
}
