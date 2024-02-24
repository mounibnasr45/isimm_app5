import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'modules_state.dart';

class ModulesCubit extends Cubit<ModluesState> {
  ModulesCubit() : super(ModluesInitial()) {
    fetchModules();
  }

  void fetchModules() async {
    emit(ModulesLoading());
    // requete http
    // tji data
    List<Module> result = [];
    await Future.delayed(const Duration(seconds: 1), () {
      result = [

      const  Module(id: 1, name: 'algorithm'),
      const  Module(id: 2, name: 'c++'),
      const  Module(id: 3, name: 'Mobile Dev'),
      const  Module(id: 4, name: 'ML'),
      ];
    });
    // emit fil stream
    emit(ModulesFetched(data: result));
  }
}
