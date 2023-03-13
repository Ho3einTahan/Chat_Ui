import 'package:chat_ui/AppBar/AppBar_StoryView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../BottomNav/BottomNavStoryView.dart';
import '../Constant/MyDataList.dart';
import '../Constant/StoryView_Constant.dart';

class Storyview_Page extends StatefulWidget {
  Storyview_Page(
      {Key? key, required this.index, required this.Image, required this.Name})
      : super(key: key);
  int? index;
  String? Image;
  String? Name;

  @override
  State<Storyview_Page> createState() => _Storyview_PageState();
}

class _Storyview_PageState extends State<Storyview_Page> {
  int index = 0;
  String Image = "";
  String Name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index!;
    Image = widget.Image!;
    Name = widget.Name!;
    if (index + 1 > MainStoryItem.length || index == 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Appbar_StoryView(Name: Name, Image: Image), preferredSize: Size(20, 60)),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StoryView(
              repeat: false,
              onComplete: () {
                if (index + 1 < MainStoryItem.length) {
                  controller.previous();
                    index = index + 1;
                    Image = DataImage[index];
                    Name = title[index];

                } else {
                  Navigator.pop(context);
                }
              },
              progressPosition: ProgressPosition.top,
              storyItems: MainStoryItem[index!],
              controller: controller),
          SendBox(),
        ],
      ),
    );
  }
}
