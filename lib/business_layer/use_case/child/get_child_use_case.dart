





import 'package:nanny_co/data/model/dto_model/child/child_response.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class GetChildUseCase extends BaseCase<void, List<ChildItem>> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<List<ChildItem>> execute(void input) async {
    ChildResponse  childResponse =  await _repository.getChild();
    if(childResponse.status == 200){
      return childResponse.data!.data;
    }else{
      return [];
    }

  }
}