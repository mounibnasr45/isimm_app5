import 'package:flutter/material.dart';
import 'package:isimm_app5/presentation/homescreen/widgets/news_item.dart';

class ListOfNews extends StatefulWidget {
  const ListOfNews({Key? key}) : super(key: key);

  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  late PageController _pageController;
  int activeIndex = 0;
  List<String> img_list = [
    "assets/images/news.jpg",
    "assets/images/news1.jpg",
    "assets/images/robotHack.jpg",
    ];
  List<String> desc_list = [
    "The list of candidates admitted to the Professional Master's in New and Renewable Energies for the academic year 2023-2024.",
    "Embark on intellectual excellence in Casablanca with a Master's degree, merging tradition and innovation. Elevate your expertise amidst a vibrant environment",
    "Dive into innovation at our Robot Hackathon! Unleash creativity, code, and circuits. Join tech enthusiasts for a day of collaboration and robotics exploration."
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: 380, // Specify the height you desire
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            children: [
              Container(
                  child: NewsItem(
                imagepath: img_list[activeIndex],
                description:desc_list[activeIndex],
                onPressed: () {},
              )),
            
            ],
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = (activeIndex + 1) % 3;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              buildDots(),
              SizedBox(
                width: screenWidth * 0.23,
              ),
              Row(
                children: [
                  Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: "Noto_Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 159, 31, 22),
                        ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: const Color.fromARGB(255, 159, 31, 22),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // Number of news items
        (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == activeIndex ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
