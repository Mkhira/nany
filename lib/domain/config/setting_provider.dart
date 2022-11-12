import 'package:nanny_co/data/model/app_settings.dart';
import 'package:nanny_co/data/model/dto_model/auth_data_response.dart';
import 'package:nanny_co/instance.dart';

abstract class SettingsProvider {
  AppSettings get appSettings;
  SettingsProvider get instance;

  static SettingsProvider? _current;
  static SettingsProvider get current => _current ??= injector.get<SettingsProvider>();
  static AuthDataResponse get userData => injector.get<SettingsProvider>().appSettings.userData!;

  void save();
  void saveUser(AuthDataResponse loginResponseModel);
  void saveTokens({String? deviceToken, String? fireBaseToken});
  void saveLogin(bool isLogin);
  void saveFirstOpen(bool isLogin);
}
