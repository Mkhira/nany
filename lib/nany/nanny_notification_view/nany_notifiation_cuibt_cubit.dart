import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/booking_history_usecase.dart';
import 'package:nanny_co/business_layer/use_case/change_booking_status.dart';
import 'package:nanny_co/business_layer/use_case/confirm_book_useusecase.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/widget/alerts.dart';

part 'nany_notifiation_cuibt_state.dart';

class NanyNotifiationCuibtCubit extends Cubit<NanyNotifiationCuibtState> {
  NanyNotifiationCuibtCubit() : super(NanyNotifiationCuibtInitial());




  Bookings? newBookins;
  getBookingHistory()async{
    newBookins = await injector.get<NewBookingUseCase>().execute(null);
    emit(NanyNotifiationCuibtNewBooking());

  }




  changeBookingStatus(BookingChangeStatusPostModel bookingData,BuildContext context)async{
  await  injector.get<ChangeBookingStatusUseCase>().execute(bookingData).then((value) =>
      Alerts.showSnackBar(context: context, message: value?.message??'',color: Colors.green));
  }

}
