import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:isimm_app5/core/utils/valurs_manager.dart';

import '../../homescreen/widgets/BuildImageWithNumber.dart';
import '../../homescreen/widgets/bannerList_of_news.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<String> imageList = [
    'assets/images/biblio1.jpg',
    'assets/images/salle1.jpg',
    'assets/images/porteisimm.jpg'
  ];
  int current = 0;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1, end: 1.15).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 30),
          const Divider(
            height: 3,
          ),
          ImageSlideshow(
            width: double.infinity,
            height: 215,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {
              setState(() {
                current = value;
              });
              print('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: imageList.map((image) {
              return AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Stack(
                      children: [
                        Image.asset(image),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 30,
                          child: Container(
                            padding:
                                const EdgeInsets.all(10), // Adjust as needed
                            child: const Text(
                              "Excellence , Networking ,Sustainability\n Innovation",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                //fontFamily: "Noto_Sans",
                                color: Color.fromARGB(255, 236, 228, 228),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          const WhyIsimm(),
          const IsimmIntro(),
          const DuoTexts(),
          const SizedBox(
            height: 15,
          ),
          const IsimmInNumbers(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/books2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Color.fromARGB(95, 50, 49, 49),
              ),
              Positioned(
                top: 30,
                left: 20,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 2.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BuildImageWithNumber(
                              imagePath: 'assets/images/enseigants.png',
                              number: 130,
                              titre: "Enseignants"),
                          BuildImageWithNumber(
                              imagePath: 'assets/images/student_hat.png',
                              number: 150,
                              titre: "Student"),
                          BuildImageWithNumber(
                              imagePath: 'assets/images/agent.png',
                              number: 63,
                              titre: "Agent"),
                          BuildImageWithNumber(
                              imagePath: 'assets/images/audience.png',
                              number: 6,
                              titre: "Clubs"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Recent Updates",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Center(
            child: Container(
              height: 1.5,
              width: 100,
              color: const Color.fromARGB(255, 3, 41, 72),
            ),
          ),
          const ListOfNews(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class IsimmInNumbers extends StatelessWidget {
  const IsimmInNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 3, 41, 72),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "ISIMM IN NUMBRES",
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Cabin",
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ));
  }
}

class WhyIsimm extends StatelessWidget {
  const WhyIsimm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(
          "Why choose ISIMM?",
          style: TextStyle(
              fontSize: 22,
              fontFamily: "Noto_Sans",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 3, 41, 72)),
        ),
      ),
    );
  }
}

class IsimmIntro extends StatelessWidget {
  const IsimmIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 10, top: 12),
      child: Text(
        "Higher Institute of Informatics and Mathematics of Monastir prides itself on the good reputation of its graduates. The school's orientation score is rising year on year, thanks to the determination of its teaching staff and the quality of its programs, which offer a judicious mix of theoretical and practical knowledge.",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600,fontSize: 13),
      ),
    );
  }
}

class DuoTexts extends StatelessWidget {
  const DuoTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon_Text(
                  first: "Dicersified Training",
                ),
                icon_Text(first: "Scientific research"),
                icon_Text(first: "Workforce Inclusion")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon_Text(first: "Community life"),
                icon_Text(first: "Key Allies"),
                icon_Text(first: "Worldwide Treaties"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class icon_Text extends StatelessWidget {
  icon_Text({
    super.key,
    required this.first,
  });
  String first;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.done_all_outlined,
          color: const Color.fromARGB(255, 133, 18, 10),
          size: 24,
        ),
        Text(
          first,
          style: const TextStyle(
              fontSize: 14,
              //fontFamily: "Cabin",
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 2, 32, 56)),
        ),
      ],
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final int current;

  CircleIndicator({required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: current == 0 ? Colors.blue : Colors.grey,
      ),
      height: 15,
      width: 15,
    );
  }
}
