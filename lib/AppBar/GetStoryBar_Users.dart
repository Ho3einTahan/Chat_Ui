import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/MyDataList.dart';
import 'StoryView.dart';

class getStoryBar extends StatelessWidget {
  getStoryBar({Key? key}) : super(key: key);
  bool Visibitly = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return Users_Content(index, context);
      },
      scrollDirection: Axis.horizontal,
      itemCount: DataImage.length,
    );
  }

  Widget Users_Content(int index, BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Storyview_Page(
                          index: index,
                          Image: DataImage[index],
                          Name:StoryBar_title[index]),
                    ),
                  );
                },
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
          padding: EdgeInsets.only(top: 8),
          child: Text(StoryBar_title[index],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 10,
              )),
        ),
      ],
    );
  }
}
