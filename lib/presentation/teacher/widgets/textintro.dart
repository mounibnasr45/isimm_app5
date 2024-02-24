import 'package:flutter/material.dart';

import '../../../core/utils/color_manager.dart';

class TextIntro extends StatelessWidget {
  const TextIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Mr(s) TeacherName",
                style: TextStyle(
              fontSize: 26,
              fontFamily: "Noto_Sans",
              fontWeight: FontWeight.bold,
              color: ColorManager.darkPrimary)
            ),
            SizedBox(
              height: 15,
            ),
         
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '"',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Stand up for the teacher and glorify him....He could have been a messenger.',
                   style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600,fontSize: 16)
                  ),
                  TextSpan(
                    text: '"',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

          
          ],
        ));
  }
}
