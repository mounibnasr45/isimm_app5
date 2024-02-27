import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

class NewsItem extends StatelessWidget {
  NewsItem(
      {super.key,
      required this.onPressed,
      required this.description,
      required this.imagepath});

  final VoidCallback onPressed;
  String imagepath;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.lightPrimary.withOpacity(0.3)),
      width: 450,
      height: 260,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14.0),
                      topRight: Radius.circular(14.0)),
                  child: Image.asset(
                    imagepath,
                    height: 150,
                    width: 360,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 149,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14.0),
                      topRight: Radius.circular(14.0)),
                  color: Color.fromARGB(112, 16, 16, 16),
                ),
              )),
          Positioned(
            top: 160,
            left: 15,
            child: Container(
              height: 135,
              width: 330,
              padding: const EdgeInsets.only(top: 5, right: 8),

              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: "Noto_Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: onPressed,
                      child: Text(
                        "Read More...",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: "Noto_Sans",
                              fontSize: 16,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              decorationColor: const Color.fromARGB(255, 0, 0,
                                  0), // You can set the color of the underline
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              left: 15,
              top: 15,
              child: Container(
                height: 65,
                width: 60,
                decoration: BoxDecoration(
                    color: ColorManager.lightPrimary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "22",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: "Noto_Sans",
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Text(
                      "May",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: "Noto_Sans",
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
