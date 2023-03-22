





import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/success_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class ChangeBookingStatusUseCase extends BaseCase<BookingChangeStatusPostModel, SuccessModel?> {
  final Repository _repository;

  ChangeBookingStatusUseCase(this._repository);
  @override
  Future<SuccessModel?> execute(BookingChangeStatusPostModel input) async {
    SuccessModel? successModel= await _repository.changeStatusBooking(input);
     return successModel;
  }
}