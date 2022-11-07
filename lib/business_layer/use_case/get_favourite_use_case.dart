





import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class GetFavouriteUseCase extends BaseCase<void, FavouriteResponseDto?> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<FavouriteResponseDto?> execute(void input) async {
    FavouriteDto _favourite = await _repository.getFavourite();

    if (_favourite.status == 200) {
      return _favourite.data;
    }
    return _favourite.data;
  }
}
