


import 'package:nanny_co/data/model/dto_model/child/add_child.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class AddChildUseCase extends BaseCase<AddChildModel, dynamic> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<dynamic> execute(AddChildModel input) async {
      return await _repository.addChild(input);

  }
}
