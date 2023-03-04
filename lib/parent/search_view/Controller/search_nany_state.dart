part of 'search_nany_cubit.dart';

@immutable
abstract class SearchNanyState {}

class SearchNanyInitial extends SearchNanyState {}
class SearchNannySearch extends SearchNanyState {}
class NannyLoading extends SearchNanyState {}
class NannyGetData extends SearchNanyState {}
