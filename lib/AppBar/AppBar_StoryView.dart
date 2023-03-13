import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constant/StoryView_Constant.dart';

class Appbar_StoryView extends StatefulWidget {
  Appbar_StoryView({Key? key, required this.Name, required this.Image}) : super(key: key);
  String? Name;
  String? Image;

  @override
  State<Appbar_StoryView> createState() => _Appbar_StoryViewState();
}

class _Appbar_StoryViewState extends State<Appbar_StoryView> {
  Icon Play = Icon(Icons.pause, color: Colors.black, size: 26);
  String Name = "";
  String Image = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name = widget.Name!;
    Image = widget.Image!;
  }

  @override
  Widget build(BuildContext context) {
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
