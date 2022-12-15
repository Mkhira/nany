import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/nanny/nanny_details_usecase.dart';
import 'package:nanny_co/business_layer/use_case/search_for_nanny_use_case.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/nanny_profile/Controller/update_nanny_profile_cubit.dart';

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
}
