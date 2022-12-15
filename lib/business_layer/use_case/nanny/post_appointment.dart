








import 'package:nanny_co/data/model/dto_model/nany/post_appointment_data.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class NannyPostAppointment extends BaseCase<PostAppointment ,dynamic>{

  final _repository = injector.get<Repository>();
  @override
  Future<dynamic> execute(PostAppointment input) {
    return _repository.postAppointment(input);
  }
}