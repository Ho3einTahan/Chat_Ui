import 'package:flutter/material.dart';

class Chat_Primary extends StatefulWidget {
  Chat_Primary({Key? key}) : super(key: key);

  @override
  State<Chat_Primary> createState() => _Chat_PrimaryState();
}

class _Chat_PrimaryState extends State<Chat_Primary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  ClipRRect(

                    child: Image.asset("images/story_1.jpg",
                        width: 55, height: 55),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
