import 'package:nanny_co/data/data_source/remote_data_source.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  late RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) {
    return _remoteDataSource.login(loginModel);
  }

  @override
  Future<LoginResponseModel> register(RegisterModel registerModel) {
    return _remoteDataSource.register(registerModel);
  }
}
