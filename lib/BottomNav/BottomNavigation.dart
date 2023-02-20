import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius:70,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(40),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey.shade200,
                iconSize: 30,
                selectedItemColor: Colors.black,
                currentIndex: index,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.rectangle_stack_person_crop),
                      label: ""),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
