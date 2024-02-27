import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

import 'groupcard.dart';
import 'groupeteacher.dart';
import 'newsViewModel.dart';
import 'newsmodel.dart';

class News extends StatefulWidget {
  String teacherId = "1";
  News(this.teacherId, {Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState(teacherId);
}

class _NewsState extends State<News> {
  final _formKey = GlobalKey<FormState>();
  String teacherId;
  final primaryColor = ColorManager.primary;

  _NewsState(this.teacherId);
  late String message = '';
  late String object = '';
  late String file = '';
  NewsModelView model = NewsModelView();
  late List<GroupCard> gList = [];

  List<TGroup> getStaticTGroups() {
    // Create a static list of TGroup
    return [
      TGroup(
          id: 1,
          name: 'CPI 1',
          sectionId: 1,
          inSection: 'Section A',
          inLevel: 'Level 1'),
      TGroup(
          id: 2,
          name: 'CPI 2',
          sectionId: 2,
          inSection: 'Section B',
          inLevel: 'Level 2'),
      TGroup(
          id: 3,
          name: 'L1INFO',
          sectionId: 3,
          inSection: 'Section B',
          inLevel: 'Level 2'),
      // Add more TGroup items as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final list = model.selectedNewsGroup(gList);
          // if (list.isEmpty) {
          //   showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //             scrollable: true,
          //             title: const Text(
          //               "CHOOSE GROUP",
          //               style: TextStyle(
          //                 color: Color(0xFF007AFF),
          //               ),
          //             ),
          //             actions: [
          //               Container(
          //                 color: primaryColor,
          //                 child: ElevatedButton(
          //                     onPressed: () {
          //                       Navigator.pop(context);
          //                     },
          //                     //color: primaryColor,
          //                     child: const Text('Quit',
          //                         style: TextStyle(color: Colors.white))),
          //               )
          //             ],
          //           ));
          // } else {
          //   if (_formKey.currentState!.validate()) {
          //     var msg = await model.postNewsToGroups(
          //         teacherId, NMessage(object: object, message: message), list);
          //     print(msg);
          //     if (msg == "Sent to the According group(s)...") {
          //       setState(() {
          //         Navigator.pop(context);
          //       });
          //     }
          //   }
          // }
        },
        backgroundColor: primaryColor,
        elevation: 20,
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: ColorManager.backgroundColor,
        title: Text("Send news",
            style: TextStyle(
                color: ColorManager.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        // leading: Container(
        //   height: 45,
        //   decoration:  BoxDecoration(
        //     color: ColorManager.backgroundColor,
        //     image: DecorationImage(
        //       image: AssetImage('assets/Logo.png'),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorManager.backgroundColor,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 6),
                child: Text(
                  "Select groups",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: Builder(
                    builder: (context) {
                      var groups =
                          getStaticTGroups(); // Get the static list of TGroup
        
                      var gList = groups.map((element) {
                        return GroupCard(GroupCardState(
                          '${element.name!}',
                          element.id.toString(),
                        ));
                      }).toList();
        
                      return ListView.builder(
                        itemBuilder: (context, idx) {
                          return gList[idx];
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: gList.length,
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 2,
                color: const Color(0xFFe5e5e5),
                margin: const EdgeInsets.fromLTRB(42, 30, 42, 0),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Content",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 26,
                          width: 106,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3282B833),
                                  blurRadius: 8,
                                  spreadRadius: 3,
                                  offset:
                                      Offset(0, 4), // changes position of shadow
                                ),
                              ]),
                          child: const Center(
                            child: Text("ATTACH FILE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (object.isEmpty) {
                      return "Object cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (object) {
                    this.object = object;
                  },
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: " Object...",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (message.isEmpty) {
                      return "Message cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  maxLines: 10,
                  onChanged: (message) {
                    this.message = message;
                  },
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Message ...",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: primaryColor,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
