import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/teachSchedule/cubit/schedule_cubit.dart';
import 'package:isimm_app5/presentation/teachSchedule/cubit/schedule_state.dart';

import '../../../core/utils/routes_manager.dart';
import '../widgets/weekdayView.dart';
import 'package:date_picker_timetable/date_picker_timetable.dart';

class TaecherSchedule extends StatefulWidget {
  TaecherSchedule({Key? key}) : super(key: key);

  @override
  _TaecherScheduleState createState() => _TaecherScheduleState();
}

class _TaecherScheduleState extends State<TaecherSchedule> {
  final ScheduleCubit _ScheduleCubit = instance<ScheduleCubit>();
  DatePickerController _controller = DatePickerController();

  DateTime _selectedDayValue = DateTime.now();
  DateTime _selectedMonthValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _ScheduleCubit,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.backgroundColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
           // elevation: 20,
            title: Text(
              "Schedule Screen",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
            ),
          ),
          body: Container(
            color: ColorManager.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromARGB(137, 235, 229, 229),
                  height: 120,
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
                      SizedBox(
                        width: 45,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Algorithm Professor",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      fontFamily: "PTSans-Bold")),
                          Text("Karim Lamouchi",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: "PTSans-Bold")),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 19, top: 15, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_box,
                              size: 20, color: ColorManager.black),
                          Text(
                            " Press To Take Attendance",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: ColorManager.darkPrimary,
                                    fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your Schedule:",
                        style: TextStyle(
                          fontFamily: "PTSans-Bold",
                          fontSize: 20,
                          color: ColorManager.darkPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DatePicker(
                        DateTime(2024, 2, 19),
                        width: 75,
                        height: 90,
                        controller: _controller,
                        initialSelectedDate: _selectedDayValue,
                        selectionColor: ColorManager.darkPrimary,
                        selectedTextColor: Colors.white,
                        daysCount: 6,
                        /*  inactiveDates: [
                    DateTime.now().add(Duration(days: 3)),
                    DateTime.now().add(Duration(days: 4)),
                    DateTime.now().add(Duration(days: 7))
                  ],*/
                        onDateChange: (date) {
                          // New date selected
                          int newday1 =
                              int.parse(date.toString().substring(8, 10));
                          int valchanged = newday1 - 18;
                          _ScheduleCubit.importSeances(valchanged);
                          setState(() {
                            _selectedDayValue = date;
                          });

                          print("3 another day selected");
                        },
                      ),
                    ],
                  ),
                ),
                BlocConsumer<ScheduleCubit, ScheduleState>(
                  listener: (context, state) {
                    if (state is ScheduleLoaded) {
                      print('ScheduleLoaded');
                    } else if (state is ScheduleError) {
                      print('error schedule');
                    } else {
                      print('else state');
                    }
                  },
                  builder: (context, state) {
                    return state is ScheduleLoaded
                        ? (WeekDayView(
                            taskCardColor: ColorManager.primary,
                            taskTitleColor: Color.fromARGB(255, 255, 255, 255),
                            taskSubtitleColor:
                                Color.fromARGB(255, 255, 255, 255),
                            SeanceList: state.l,
                          ))
                        : Container(
                            child: const CircularProgressIndicator(),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
