




import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class NannyDetailsUseCase extends BaseCase<String ,NannyDetails>{

  final _repository = injector.get<Repository>();
  @override
  Future<NannyDetails> execute(String input) {
    return _repository.getNanny(input);
  }
}