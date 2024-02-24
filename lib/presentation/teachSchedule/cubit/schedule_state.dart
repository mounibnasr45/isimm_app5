import 'package:equatable/equatable.dart';

import '../../../data/models/seance.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();
  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ChangeDay extends ScheduleState {
  ChangeDay({required this.newday});
  int newday;
}

class ScheduleLoaded extends ScheduleState {
  ScheduleLoaded({required this.l});
  final List<SeanceData> l;
}

class ScheduleError extends ScheduleState {}
