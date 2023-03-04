import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class Storyview_Page extends StatelessWidget {
  Storyview_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoryView(
        repeat: false,
        onComplete: () {
          Navigator.pop(context);
        },
        progressPosition: ProgressPosition.top,
        storyItems: storyItem,
        controller: controller);
  }
}

StoryController controller = StoryController();
List<StoryItem> storyItem = [
  StoryItem.text(
      title: "سلام حسین طحان هستم یا پروژه های دیگری منتظر ما باشید.",
      backgroundColor: Colors.yellow,
      textStyle: TextStyle(
        fontSize: 18,
      )),
  StoryItem.pageImage(
    imageFit: BoxFit.contain,
      caption: "پشت سیستم یهویی",
      url:
          "https://cdn.utaustinbootcamps.com/wp-content/uploads/sites/119/2020/12/tes_gen_blog_code7-1-800x412.jpg",
      controller: controller),
  StoryItem.pageImage(
      url:
          "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
      controller: controller),
];
