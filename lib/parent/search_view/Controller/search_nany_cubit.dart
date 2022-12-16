import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/booking_history_usecase.dart';
import 'package:nanny_co/business_layer/use_case/confirm_book_useusecase.dart';
import 'package:nanny_co/business_layer/use_case/nanny/nanny_details_usecase.dart';
import 'package:nanny_co/business_layer/use_case/search_for_nanny_use_case.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/nanny_profile/Controller/update_nanny_profile_cubit.dart';
import 'package:nanny_co/nany/widget/alerts.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';

part 'search_nany_state.dart';

class SearchNannyCubit extends Cubit<SearchNanyState> {
  SearchNannyCubit() : super(SearchNanyInitial());
  var start = DateFormat('hh:mm a').format(DateTime.now());
  var end = DateFormat('hh:mm a').format(DateTime.now());
  var startdate = DateFormat('MMM,dd,yyyy').format(DateTime.now());
  var enddate = DateFormat('MMM,dd,yyyy').format(DateTime.now());

  SearchForNannyModel? searchForNannyModel;
  searchNanny() async {
    searchForNannyModel = await injector.get<SearchForNannyUseCase>().execute(
        NannySearchFilterModel(
            cityId: injector.get<UpdateNannyProfileCubit>().cityIdValue,
            // entryTime: start,
            // exitTime: end,
            // dateFrom: startdate,
            // dateTo: enddate
           ));
    emit(SearchNannySearch());
  }


  NannyDetails? nannyDetails;

  getNannyDetails(String id)async{
    nannyDetails = await injector.get<NannyDetailsUseCase>().execute(id);
  }


  List<int> childIds =[];
  List<bool> checkBoxValues =[];
    generateValues(){
      injector.get<AddChildCubit>().childList.forEach((element) {
        checkBoxValues.add(false);

      });
      emit(SearchNannySearch());

    }
  changeValue(int index,bool value){
    checkBoxValues[index]= value;
    if(value == true){
      childIds.add(injector.get<AddChildCubit>().childList[index].id);
    }else{

      childIds.removeAt(index);
    }
    emit(SearchNannySearch());

  }

  Future<dynamic>confirmBook({required BookPostModel bookPostModel,required BuildContext context})async{
    await  injector.get<ConfirmBookUseCase>().execute(bookPostModel).then((value) => Alerts.showSnackBar(context: context, message: value['message'],color: Colors.green));
    emit(SearchNannySearch());
  }


  Bookings? bookings;
  getBookingHistory()async{
    bookings = await injector.get<BookingHistoryUseCase>().execute(null);
    emit(SearchNannySearch());

  }

}
