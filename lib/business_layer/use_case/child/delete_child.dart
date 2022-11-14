








import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class DeleteChildUse extends BaseCase<String, dynamic> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<dynamic> execute(String input) async {
    return await _repository.delete(input);
  }
}