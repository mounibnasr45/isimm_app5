import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/retry.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/seance.dart';
import 'package:isimm_app5/domain/use_cases/teacherschedule_UseCase.dart';

import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial()) {
    importSeances(1);
  }
  final SeanceUseCase _seanceUseCase=SeanceUseCase();
  int currentday = 1;
  void importSeances(int newd) async {
     daychanged(newd);
    emit(ScheduleLoading());
    final Either<Failure, List<SeanceData>> result =
        await _seanceUseCase.execute(3, currentday);

    result.fold(
      (failure) {
        emit(ScheduleError());
      },
      (seances) {
        emit(ScheduleLoaded(l: seances));
      },
    );
  }

  void daychanged(int newd) {
    currentday = newd;
  }
}
