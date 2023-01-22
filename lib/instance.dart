import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nanny_co/business_layer/use_case/add_remove_favorite_use_case.dart';
import 'package:nanny_co/business_layer/use_case/child/delete_child.dart';
import 'package:nanny_co/business_layer/use_case/child/get_child_use_case.dart';
import 'package:nanny_co/business_layer/use_case/confirm_book_useusecase.dart';
import 'package:nanny_co/business_layer/use_case/get_appointment_use_case.dart';
import 'package:nanny_co/business_layer/use_case/get_cities_use_case.dart';
import 'package:nanny_co/business_layer/use_case/get_favourite_use_case.dart';
import 'package:nanny_co/business_layer/use_case/login_use_case.dart';
import 'package:nanny_co/business_layer/use_case/nanny/post_appointment.dart';
import 'package:nanny_co/business_layer/use_case/update_use_case/sister_update_use_case.dart';
import 'package:nanny_co/business_layer/use_case/update_use_case/update_parent_use_ase.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';
import 'package:nanny_co/parent/parent_profile/Controller/update_parent_cubit/update_parent_cubit.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';
import 'package:nanny_co/shared_cubit/settings_hive/settings_cubit_hive.dart';

import 'business_layer/use_case/booking_history_usecase.dart';
import 'business_layer/use_case/change_password_use_case.dart';
import 'business_layer/use_case/check_email_use_case.dart';
import 'business_layer/use_case/child/add_child_use_case.dart';
import 'business_layer/use_case/nanny/nanny_details_usecase.dart';
import 'business_layer/use_case/register_use_case.dart';
import 'business_layer/use_case/search_for_nanny_use_case.dart';
import 'business_layer/use_case/verify_use_case.dart';
import 'data/data_source/remote_data_source.dart';
import 'data/network/api.dart';
import 'data/network/dio_factory.dart';
import 'data/repository/repository.dart';
import 'domain/config/setting_provider.dart';
import 'domain/repository/repository.dart';
import 'nany/nanny_profile/Controller/update_nanny_profile_cubit.dart';

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
  injector.registerLazySingleton<RegisterParentUseCase>(() => RegisterParentUseCase(injector()));
  injector.registerLazySingleton<RegisterSitterUseCase>(() => RegisterSitterUseCase(injector()));
  injector.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase(injector()));
  injector.registerLazySingleton<CheckEmailUseCase>(() => CheckEmailUseCase(injector()));
  injector.registerLazySingleton<VerifyUseCase>(() => VerifyUseCase(injector()));
  injector.registerLazySingleton<GetCitiesUseCase>(() => GetCitiesUseCase());
  injector.registerLazySingleton<UpdateParentUseCase>(() => UpdateParentUseCase());
  injector.registerLazySingleton<SisterUpdateUseCase>(() => SisterUpdateUseCase());
  injector.registerLazySingleton<GetFavouriteUseCase>(() => GetFavouriteUseCase());
  injector.registerLazySingleton<AddRemoveFavouriteUseCase>(() => AddRemoveFavouriteUseCase());
  injector.registerLazySingleton<SearchForNannyUseCase>(() => SearchForNannyUseCase());
  injector.registerLazySingleton<UpdateParentCubit>(() => UpdateParentCubit());
  injector.registerLazySingleton<UpdateNannyProfileCubit>(() => UpdateNannyProfileCubit());
  injector.registerLazySingleton<AddChildCubit>(() => AddChildCubit());
  injector.registerLazySingleton<AddChildUseCase>(() => AddChildUseCase());
  injector.registerLazySingleton<DeleteChildUse>(() => DeleteChildUse());
  injector.registerLazySingleton<GetChildUseCase>(() => GetChildUseCase());
  injector.registerLazySingleton<SearchNannyCubit>(() => SearchNannyCubit());
  injector.registerLazySingleton<NannyDetailsUseCase>(() => NannyDetailsUseCase());
  injector.registerLazySingleton<GetAppointments>(() => GetAppointments());
  injector.registerLazySingleton<NannyPostAppointment>(() => NannyPostAppointment());
  injector.registerLazySingleton<ConfirmBookUseCase>(() => ConfirmBookUseCase());
  injector.registerLazySingleton<BookingHistoryUseCase>(() => BookingHistoryUseCase());
}
