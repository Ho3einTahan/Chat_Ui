import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 31, top: 8, right: 10),
      height: 50,
      width:50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(35),
        image: DecorationImage(image: AssetImage("images/story_1.jpg"),),
      ),
    );
  }
}
