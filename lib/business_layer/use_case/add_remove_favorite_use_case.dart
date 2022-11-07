




import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class AddRemoveFavouriteUseCase extends BaseCase<AddFavoriteDto,AddFavouriteResponse?>{
  final Repository _repository = injector.get<Repository>();

  @override
  Future<AddFavouriteResponse?> execute(AddFavoriteDto input) {
      return _repository.addRemoveFavourite(input);

  }


}