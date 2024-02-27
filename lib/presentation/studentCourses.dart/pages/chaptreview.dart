import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/presentation/studentCourses.dart/cubit/chapter/chapter_cubit.dart';
import 'package:isimm_app5/presentation/studentCourses.dart/cubit/module/modules_cubit.dart';
import 'package:isimm_app5/presentation/studentCourses.dart/widgets/chaptrecard.dart';

class ChapterPage extends StatelessWidget {
  ChapterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModulesCubit>(create: (context) => ModulesCubit()),
        BlocProvider<ChapterCubit>(create: (context) => ChapterCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.backgroundColor,
          elevation: 0, // pour retirer la shadow de l'AppBar
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "CPI1 Courses",
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            // borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //chapter_appBar(),

              const Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                child: Column(
                  children: [
                    Text(
                      "Modules",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              BlocConsumer<ModulesCubit, ModluesState>(
                listener: (context, state) {
                  //fe listener nzidu haja much tabaa widget kima alert dialog
                  if (state is ModulesFetchingFailed) {
                    // show alert dialog
                  }
                },
                builder: (context, state) {
                  if (state is ModulesLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ModulesFetched) {
                    return SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        // ListView.separated(
                        //   separatorBuilder: (context, idx) => const Divider(),
                        itemBuilder: (context, idx) {
                          return ModuleItem(
                            icon: Icons.book,
                            label: state.data[idx].name,
                            onPressed: () {
                              BlocProvider.of<ChapterCubit>(context)
                                  .fetchChaptersByModule(idx);
                            },
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.length,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('Some thing went wrong'),
                    );
                  }
                },
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Chapters",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.85),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: BlocConsumer<ChapterCubit, ChapterState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state is ChaptersLoading) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (state is ChaptersFetched) {
                                    return Container(
                                      // color: Colors.red,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return ChapterCard(
                                              title: state.data[index]);
                                        },
                                      ),
                                    );
                                  } else {
                                    return Text("Something went Wrong");
                                  }
                                }),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModuleItem extends StatelessWidget {
  const ModuleItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //color: Colors.white,
        width: 100,
        height: 107,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 7, bottom: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Icon(
                icon,
                size: 44,
                color: ColorManager.primary,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
