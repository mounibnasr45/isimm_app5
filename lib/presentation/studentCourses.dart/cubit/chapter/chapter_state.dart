part of 'chapter_cubit.dart';

abstract class ChapterState extends Equatable {}

class ChapterInitial extends ChapterState {
  @override
  List<Object?> get props => [];
}

class ChaptersLoading extends ChapterState {
  @override
  List<Object?> get props => [];
}

class ChaptersFetched extends ChapterState {
  ChaptersFetched({required this.data});
  final List<String> data;
  @override
  List<Object?> get props => [data];
}
// TODO: lezmha tkoun fi  data/modules
class Module {
  const Module({required this.id, required this.name});
  final int id;
  final String name;
}
