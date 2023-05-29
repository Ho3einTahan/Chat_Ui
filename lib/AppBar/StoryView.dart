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
  Icon Play = Icon(Icons.pause, color: Colors.black, size: 26);
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
      appBar:AppBarStory(),
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
                  setState(() {
                  });
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
  PreferredSizeWidget AppBarStory(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 150,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/${Image}.jpg"),
            ),
          ),
          Text(
            Name,
            style: TextStyle(color: Colors.black,fontSize: 12),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (Play.icon == Icons.pause) {
                setState(() {
                  Play = Icon(Icons.play_arrow, color: Colors.black, size: 26);
                });
                controller.pause();
              } else {
                setState(() {
                  Play = Icon(Icons.pause, color: Colors.black, size: 26);
                });
                controller.play();
              }
            },
            icon: Play),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            Play = Play.icon == Icons.pause
                ? Icon(Icons.pause, color: Colors.black, size: 26)
                : Icon(Icons.pause, color: Colors.black, size: 26);
          },
          icon: Icon(Icons.close, size: 26, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(CupertinoIcons.ellipsis_vertical,
              color: Colors.black, size: 26),
        ),
      ],
    );
  }
}