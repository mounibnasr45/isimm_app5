import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  ChapterCubit() : super(ChapterInitial()) {
    fetchChaptersByModule(0);
  }

  void fetchChaptersByModule(int i) async {
    List<String> chapters = [];
    emit(ChaptersLoading());
    await Future.delayed(const Duration(seconds: 1), () {
      if (i == 0) {
        chapters = ['recursivité', 'BigO', 'Complexité', 'Data Structure'];
      }
      else if(i==1){chapters = ['Variables and Constantes', 'Arrays', 'Recursion', 'OOP'];}
      else if(i==2){chapters = ['Android vs Ios', 'Kotlin', 'Flutter', 'Design pattern'];}
      else if(i==3){chapters = ['ML Introduction', 'ML types', 'Supervised ML', 'UnSupervised ML'];}

    });
    emit(ChaptersFetched(data: chapters));
  }
}
