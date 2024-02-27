import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorManager.primary,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Address: Stah Jabbeur, Monastir 5000 Tunisia",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Phone: +216 70 011 920",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Email: isimminfo@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.perm_contact_calendar,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Website: www.isimm.rnu.tn",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/isimmTunisie.png",
            width: double.infinity,
            height: 50,
          ),
        )
      ],
    );
  }
}
