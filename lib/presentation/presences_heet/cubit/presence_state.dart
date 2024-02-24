import 'package:isimm_app5/data/models/studentdata.dart';

abstract class PresenceSheetState {}

class PresenceSheetStateLoaded extends PresenceSheetState {
  PresenceSheetStateLoaded({required this.Liststudents});
  final List<StudentData> Liststudents;
}

class PresenceSheetStateloading extends PresenceSheetState {}

class PresenceSheetStateInitial extends PresenceSheetState {}

class PresenceSheetStateError extends PresenceSheetState {}

class AddAbsentLoading extends PresenceSheetState {}

class AbsentAdded extends PresenceSheetState {
  AbsentAdded({required this.nbRows});
  final int nbRows;
}

class AddAbsentError extends PresenceSheetState {}
