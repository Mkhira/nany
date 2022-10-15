import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nanny_co/data/model/app_settings.dart';
import 'package:nanny_co/data/model/dto_model/auth_data_response.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';

part 'settings_state_hive.dart';

class SettingsHiveCubit extends HydratedCubit<SettingsLoaded> implements SettingsProvider {
  SettingsHiveCubit() : super(SettingsLoaded(AppSettings()));

  static SettingsHiveCubit get(BuildContext context) => BlocProvider.of(context);

  bool exit = false;

  @override
  AppSettings get appSettings => state.appSettings;

  @override
  SettingsProvider get instance => this;

  @override
  void save() {
    emit(SettingsLoaded(state.appSettings));
  }

  @override
  SettingsLoaded? fromJson(Map<String, dynamic> json) {
    try {
      final settings = AppSettings.fromJson(json);
      return SettingsLoaded(settings);
    } catch (e) {
      debugPrint(e.toString());
      return SettingsLoaded(AppSettings());
    }
  }

  @override
  Map<String, dynamic>? toJson(SettingsHiveState state) {
    if (state is SettingsLoaded) {
      return state.appSettings.toJson();
    } else {
      return null;
    }
  }

  @override
  void saveUser(AuthDataResponse loginResponseModel) {
    state.appSettings.userData = loginResponseModel;
    save();
  }

  @override
  void saveTokens({String? deviceToken, String? fireBaseToken}) {
    state.appSettings.fireBaseToken = fireBaseToken;
    state.appSettings.deviceToken = deviceToken;
    save();
  }
}
