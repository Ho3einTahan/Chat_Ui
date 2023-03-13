import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

StoryController controller = StoryController();
List<StoryItem> storyItem1 = [
  StoryItem.text(
      title: "test0",
      backgroundColor: Colors.yellow,
      textStyle: TextStyle(
        fontSize: 18,
      )),
  StoryItem.pageImage(
      imageFit: BoxFit.contain,
      caption: "پشت سیستم یهویی",
      url: "https://i.ibb.co/8YtZKNv/download-3.jpg",
      controller: controller),
  StoryItem.pageImage(
      url: "https://i.ibb.co/ZNJ93jt/images.jpg", controller: controller),
];
List<StoryItem> storyItem2 = [
  StoryItem.text(
      title: "test1",
      backgroundColor: Colors.yellow,
      textStyle: TextStyle(
        fontSize: 18,
      )),
  StoryItem.pageImage(
    imageFit: BoxFit.contain,
    url: "https://i.ibb.co/JHztK87/images-1.jpg",
    controller: controller,
  ),
  StoryItem.pageImage(
      imageFit: BoxFit.contain,
      caption: "پشت سیستم برگرد",
      url: "https://i.ibb.co/2k2nJGh/download.jpg",
      controller: controller),
  StoryItem.pageImage(
      url: "https://i.ibb.co/TwbrKZB/download-2.jpg", controller: controller),
];
List<StoryItem> storyItem3 = [
  StoryItem.text(
      title: "test2",
      backgroundColor: Colors.yellow,
      textStyle: TextStyle(
        fontSize: 18,
      )),
  StoryItem.pageImage(
      imageFit: BoxFit.contain,
      url: "https://i.ibb.co/8XTXwLk/maxresdefault.jpg",
      caption: "پشت سیستم یهویی",

      controller: controller),
  StoryItem.pageImage(
    url: "https://i.ibb.co/59hH0QJ/maxresdefault-1.jpg"
 , controller: controller),
];
List<StoryItem> storyItem4 = [
  StoryItem.text(
      title: "test3",
      backgroundColor: Colors.yellow,
      textStyle: TextStyle(
        fontSize: 18,
      )),
  StoryItem.pageImage(
      imageFit: BoxFit.contain,
      caption: "پشت سیستم یهویی",
      url:"https://i.ibb.co/wysD4Yt/maxresdefault-2.jpg",
      controller: controller),
  StoryItem.pageImage(
      url:"https://i.ibb.co/54H90cz/2f118a9971e4ca6ad737.png",

      controller: controller),
];
List MainStoryItem = [
  storyItem1,
  storyItem2,
  storyItem3,
  storyItem4,
];
