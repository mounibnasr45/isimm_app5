import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_cubit.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_state.dart';
import 'package:isimm_app5/presentation/shared/alert.dart';

import '../../../domain/entities/models.dart';

class PresenceSheet extends StatefulWidget {
  PresenceSheet({Key? key, required this.subjectName}) : super(key: key);

  final String subjectName;
  @override
  State<PresenceSheet> createState() => _PresenceSheetState();
}

class _PresenceSheetState extends State<PresenceSheet> {
  late String formattedDate;
  late DateTime todayDate;

  @override
  void initState() {
    super.initState();
    context.read<PresenceSheetCubit>().importStudents(widget.subjectName);
    print("from presence sheet ${widget.subjectName}");
    todayDate = DateTime.now();
    formattedDate = "${todayDate.year}-${todayDate.month}-${todayDate.day}";
  }

  final PresenceSheetCubit _presencecubit = instance<PresenceSheetCubit>();
  Map<int, bool> isPresentMap =
      {}; // Map to store the present state for each student
  Map<int, bool> isAbsentMap =
      {}; // Map to store the absent state for each student

  // List<User> studentusers = [
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Presence Sheet",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocConsumer<PresenceSheetCubit, PresenceSheetState>(
                      listener: (BuildContext context, Object? state) {
                    if (state is AbsentAdded) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          context
                              .read<PresenceSheetCubit>()
                              .importStudents(widget.subjectName);
                          return const MyAlertDialog(
                            title: "Absent Added",
                            message: 'Return to Precedent Page',
                            actionText: 'OK',
                          );
                        },
                      );
                    }
                  }, builder: (context, state) {
                    if (state is AbsentAdded) {
                      return Container();
                    } else if (state is PresenceSheetStateLoaded) {
                      return
                          //Column(
                          //children: [
                          Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(" $todayDate",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("TD: CPI1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.Liststudents.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < state.Liststudents.length) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 15, right: 15, left: 15),
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        height: 90,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.Liststudents[index]
                                                      .student_id
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  state.Liststudents[index].nom,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              endIndent: 5,
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text("Present")),
                                               Checkbox(
  value: isAbsentMap[index] == null ? true : !isAbsentMap[index]!,
  onChanged: (value) {
    setState(() {
      isAbsentMap[index] = value ?? false;
    });
  },
),
                                                const Spacer(),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text("Absent")),
                                                Checkbox(
                                                    value: isAbsentMap[index] ??
                                                        false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isAbsentMap[index] =
                                                            value ?? false;
                                                      });
                                                    }),
                                                const Spacer(),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text("Absent NB:")),
                                                Text(state.Liststudents[index]
                                                    .nb_absent
                                                    .toString()),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        left: 260,
                                        right: 20,
                                        top: 15,
                                        bottom: 10),
                                    width: 90,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          for (var entry
                                              in isAbsentMap.entries) {
                                            int idStuent = entry.key;
                                            bool value = entry.value;
                                            print(
                                                "id student absent $idStuent");
                                            if (value == true) {
                                              int subj_id = nameSubjToID(
                                                  widget.subjectName);
                                              context
                                                  .read<PresenceSheetCubit>()
                                                  .addAbsent(
                                                      idStuent + 1, subj_id);
                                              print(
                                                  'Student $idStuent+1 isAbsent: $value');
                                            }
                                            // Do something with key and value
                                          }
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Save"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(Icons.save_alt)
                                          ],
                                        )),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is PresenceSheetStateloading ||
                        state is AddAbsentLoading)
                      return CircularProgressIndicator();
                    else {
                      return Text("Opps Error has occured $state");
                    }
                  }),
                ),
              ],
            )));
  }
}
