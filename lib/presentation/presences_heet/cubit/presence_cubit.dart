import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/presencesheet.dart';
import 'package:isimm_app5/data/data_source/studentAbsent.dart';
import 'package:isimm_app5/domain/use_cases/presencesheetUseCase.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_state.dart';

class PresenceSheetCubit extends Cubit<PresenceSheetState> {
  PresenceSheetData m = PresenceSheetData();
  PresenceSheetCubit() : super(PresenceSheetStateInitial());
  final PresenceSheetUseCase _presenceSheetUseCase = PresenceSheetUseCase();

  void importStudents(String subject) async {
    emit(PresenceSheetStateloading());
    print("subject from cubit $subject");
    int idsubj = nameSubjToID(subject);
    print("idsubj $idsubj");
    final Either<Failure, List<studentAbs>> result =
        await _presenceSheetUseCase.execute("cpi1", 3);

    result.fold((failure) {
      emit(PresenceSheetStateError());
    }, (students) {
      emit(PresenceSheetStateLoaded(Liststudents: students));
    });
  }

  void addAbsent(int idstudent, int id_subj) async {
    emit(AddAbsentLoading());
    Either<Failure, int> rowsAffected = await m.addAbsent(idstudent, id_subj);

    rowsAffected.fold(
      (failure) {
        // Handle the failure
        print("Error: $failure");
        emit(AddAbsentError());
      },
      (NbrowsAffected) {
        // Iterate over the list of MarksData
        emit(AbsentAdded(nbRows: NbrowsAffected));
        print("subject name ${NbrowsAffected}");
      },
    );
  }
}

int nameSubjToID(String name) {
  switch (name) {
    case "algorithme":
      return 0;
    case "java":
      return 3;
    case "c++":
      return 1;
    case "anglais":
      return 2;
    case "uml_ocl":
      return 4;
    case "droit":
      return 5;
    case "algebre":
      return 6;
    case "analyse":
      return 7;
    default:
      return -1;
  }
}
