




import 'package:nanny_co/data/model/dto_model/apointments.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class GetAppointments extends BaseCase<void ,Appointments>{

  final _repository = injector.get<Repository>();
  @override
  Future<Appointments> execute(void input) {
    return _repository.getAppointments();
  }
}