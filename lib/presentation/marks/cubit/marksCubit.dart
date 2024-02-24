import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/marksData.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/use_cases/marksUseCase.dart';
import 'package:isimm_app5/domain/use_cases/presencesheetUseCase.dart';
import 'package:isimm_app5/presentation/marks/cubit/marksState.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_state.dart';

class MarksCubit extends Cubit<MarksState> {
  MarksCubit(this._marksUseCase)
      : super(MarksStateInitial()) {
    importMarks();
  }
  final MarksUseCase _marksUseCase;

  void importMarks() async {
    emit(MarksLoading());

    final Either<Failure, List<MarksData>> result =
        await _marksUseCase.execute(1);

    result.fold((failure) {
      emit(MarksError());
    }, (marks) {
      emit(MarksLoaded(marksList: marks));
    });
  }
}
