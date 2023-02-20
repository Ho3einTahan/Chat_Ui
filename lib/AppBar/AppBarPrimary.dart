import 'package:chat_ui/AppBar/ProfileImage.dart';
import 'package:chat_ui/AppBar/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppBarPrimary() {
  return AppBar(
    elevation: 0,
    leadingWidth: 147,
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffCBF1FA),
            Color(0xffCCF6B4),
            Color(0xffEDFAF8),
          ],
        ),
      ),
    ),
    actions: [
      SearchBar(),
      ProfileImage(),
    ],
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "GoodMorning",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Alissya Octavia",
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

class getStoryBar extends StatefulWidget {
  getStoryBar({Key? key}) : super(key: key);

  @override
  State<getStoryBar> createState() => _getStoryBarState();
}

class _getStoryBarState extends State<getStoryBar> {
  List<String> DataImage = [
    "story_1",
    "story_2",
    "story_3",
    "story_4",
    "story_5",
    "story_6",
    "story_7",
    "story_8",
    "story_9",
    "story_10"
  ];
  List<String> DataName = [
    "Me",
    "Esfelle",
    "Colton",
    "Cameron",
    "Alex",
    "Joiden",
    "Tramp",
    "Dortmon",
    "Byden",
    "Obama",
  ];
  bool Visibitly = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "images/${DataImage[index]}.jpg",
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: Visibitly,
                  child: Positioned.fill(
                      left: 60,
                      top: 55,
                      child: Icon(
                          index == 0 ? CupertinoIcons.add_circled_solid : null,
                          size: 28)),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8),
              child: Text(DataName[index],style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              )),
            ),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: DataImage.length,
    );
  }
}
