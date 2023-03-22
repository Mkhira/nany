



















import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class BookingHistoryUseCase extends BaseCase<void ,Bookings>{

  final _repository = injector.get<Repository>();
  @override
  Future<Bookings> execute(void input) {
    return _repository.getParentBooking('3');
  }
}class NewBookingUseCase extends BaseCase<void ,Bookings>{

  final _repository = injector.get<Repository>();
  @override
  Future<Bookings> execute(void input) {
    return _repository.getParentBooking('2');
  }
}class UpCommingHistory extends BaseCase<void ,Bookings>{

  final _repository = injector.get<Repository>();
  @override
  Future<Bookings> execute(void input) {
    return _repository.getParentBooking('1');
  }
}