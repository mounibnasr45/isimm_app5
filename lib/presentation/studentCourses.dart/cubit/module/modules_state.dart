part of 'modules_cubit.dart';

abstract class ModluesState extends Equatable {}

class  ModluesInitial extends  ModluesState {
  @override
  List<Object?> get props => [];
}
class ModulesLoading extends ModluesState {
  @override
  List<Object?> get props => [];
}


class ModulesFetched extends ModluesState {
  ModulesFetched({required this.data});
  final List<Module> data;
  @override
  List<Object?> get props => [data];
}

class ModulesFetchingFailed extends ModluesState {
  ModulesFetchingFailed({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

// TODO: lezmha tkoun fi  data/modules
class Module {
  const Module({required this.id, required this.name});
  final int id;
  final String name;
}
