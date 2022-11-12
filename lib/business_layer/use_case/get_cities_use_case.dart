import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class GetCitiesUseCase extends BaseCase<void, List<CityModel>> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<List<CityModel>> execute(void input) async {
    CitiesModel _citiesModel = await _repository.getCites();

    if (_citiesModel.status == 200) {
      print(_citiesModel.data?.data);
      return _citiesModel.data?.data ?? [];
    }
    return [];
  }
}
