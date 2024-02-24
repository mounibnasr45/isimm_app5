import 'package:isimm_app5/data/models/marksData.dart';

abstract class MarksState {}

class MarksLoading extends MarksState {
  MarksLoading();
}

class MarksLoaded extends MarksState {
  MarksLoaded({required this.marksList});
  List<MarksData> marksList;
}

class MarksError extends MarksState {}
class MarksStateInitial extends MarksState {}
