import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

class GroupCard extends StatefulWidget {
  GroupCardState state;
  GroupCard(this.state, {Key? key}) : super(key: key);

  @override
  State<GroupCard> createState() => state;
}

class GroupCardState extends State<GroupCard> {
  String name;
  String id;
  GroupCardState(this.name, this.id);
  bool tapped = false;
  bool isTapped() => tapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          width: 70,
          decoration: BoxDecoration(
              color: tapped
                  ? ColorManager.primary
                  : ColorManager.primary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/audience.png",
                width: 40,
                height: 35,
                color: tapped ? Colors.black : Colors.white,
              ),
              Text(name,
                  style: TextStyle(
                      color:
                          tapped ? Color.fromARGB(255, 0, 0, 0) : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
