import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/feed/view/feed.dart';
import 'package:isimm_app5/presentation/marks/cubit/marksCubit.dart';
import 'package:isimm_app5/presentation/marks/cubit/marksState.dart';

class Marks extends StatelessWidget {
  Marks({Key? key});
  final MarksCubit _marksCubit = instance<MarksCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _marksCubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.backgroundColor,
          appBar: AppBar(
            backgroundColor: ColorManager.backgroundColor,
            elevation: 20,
            title: Text(
              "Marks",
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: ColorManager.primary,
                  // height: 120,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 30),
                      Container(
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/professor_img.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Id:09727516",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  fontFamily: "PTSans-Bold",
                                ),
                          ),
                          Text(
                            "Name: H.Ghodhbani",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "PTSans-Bold",
                                ),
                          ),
                          Text(
                            "TD: CPI2",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: "PTSans-Bold",
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber,
                      size: 18,
                      color: Color.fromARGB(255, 175, 35, 25),
                    ),
                    Text(
                        "if you have objection for the result Don't hesitate to..."),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text("Your Grades : ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Cabin",
                          color: Color.fromARGB(255, 3, 41, 72))),
                ),
              ),
              BlocConsumer<MarksCubit, MarksState>(
                  listener: (BuildContext context, Object? state) {},
                  builder: (context, state) {
                    if (state is MarksLoaded) {
                      return Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DataTable2(
                            columnSpacing: 10,
                            horizontalMargin: 0,
                            minWidth: MediaQuery.of(context).size.width,
                            columns: const [
                              DataColumn2(
                                label: Text('SubjectName',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                size: ColumnSize.L,
                              ),
                              DataColumn(
                                label: Text('TP',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              DataColumn(
                                label: Text(' DS',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              DataColumn(
                                label: Text('Exam',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              8,
                              (index) => DataRow(cells: [
                                DataCell(Text(
                                    state.marksList[index].subjectName,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700))),
                                DataCell(Text(
                                    state.marksList[index].tp.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400))),
                                DataCell(Text(
                                    state.marksList[index].ds.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400))),
                                DataCell(
                                  Text(state.marksList[index].exam.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400)),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 40),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("Status:Success  MOY=12,33"),
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
