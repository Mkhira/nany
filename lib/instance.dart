import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nanny_co/busoness_layer/use_case/login_use_case.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';
import 'package:nanny_co/shared_cubit/settings_hive/settings_cubit_hive.dart';

import 'busoness_layer/use_case/register_use_case.dart';
import 'data/data_source/remote_data_source.dart';
import 'data/network/api.dart';
import 'data/network/dio_factory.dart';
import 'data/repository/repository.dart';
import 'domain/config/setting_provider.dart';
import 'domain/repository/repository.dart';

final injector = GetIt.instance;

Future<void> initAppModule() async {
  // shared prefs instance

  // networl instance
  // dio factory
  injector.registerLazySingleton<DioFactory>(() => DioFactory());

  // app service client
  final dio = await injector<DioFactory>().getDio();
  injector.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  injector.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(injector()));

  // repository
  injector.registerLazySingleton<Repository>(() => RepositoryImpl(injector()));

  //Infrastructure
  injector.registerLazySingleton<Dio>(() => Dio());
  injector.registerLazySingleton<SettingsHiveCubit>(() => SettingsHiveCubit());
  injector.registerLazySingleton<AuthCubit>(() => AuthCubit());
  injector.registerLazySingleton<SettingsProvider>(() => injector.get<SettingsHiveCubit>());

  //Integrators

  //UseCase
  injector.registerLazySingleton<LoginUseCase>(() => LoginUseCase(injector()));
  injector.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(injector()));
}
