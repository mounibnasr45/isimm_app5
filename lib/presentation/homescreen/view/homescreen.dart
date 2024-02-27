import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/presentation/homescreen/widgets/homeAppBar.dart';
import 'package:isimm_app5/presentation/login/cubit/login_cubit.dart';
import 'package:isimm_app5/presentation/login/cubit/login_state.dart';
import 'package:isimm_app5/presentation/student/view/studentView.dart';
import 'package:isimm_app5/presentation/studentCourses.dart/pages/chaptreview.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/utils/routes_manager.dart';
import '../../feed/view/feed.dart';
import '../../maps.dart';
import '../../teacher/view/teacherview.dart';
import '../widgets/BuildImageWithNumber.dart';
import '../widgets/bannerList_of_news.dart';
import '../widgets/news_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  List<Widget> pages = [
    const FeedPage(),
    StudentLife(),
    TeacherView(),
    Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Text('page 4 '),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      print(state);
      // Check if the current state is LoginLoaded
      // if (state is LoginLoaded) {
      return SafeArea(
        child: Scaffold(
          //backgroundColor: ColorManager.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: HomeAppBar(mystate:state),
          ),

          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() {
              _currentIndex = i;
              _pageController.jumpToPage(i);
            }),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: ColorManager.darkPrimary,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.school),
                title: Text("Student"),
                selectedColor: ColorManager.darkPrimary,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.co_present_rounded),
                title: Text("Professor"),
                selectedColor: ColorManager.darkPrimary,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: ColorManager.darkPrimary,
              ),
            ],
          ),
          body: PageView(
              children: pages,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
      );
      //  } else {
      //    return CircularProgressIndicator();
      //  }
    });
  }
}
