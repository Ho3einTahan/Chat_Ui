import 'package:chat_ui/BottomNav/BottomNavigation.dart';
import 'package:chat_ui/BottomNav/FloatingActionButton.dart';
import 'package:chat_ui/Chat/Chat_Primary.dart';
import 'package:flutter/material.dart';
import 'AppBar/AppBarPrimary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xffCBF1FA),
              Color(0xffEDFAF8),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButtonPrimary(),
          appBar: AppBarPrimary(),
          bottomNavigationBar: BottomNavigation(),
          body: Column(
            children: [
              Container(
                height: 110,
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
                child: getStoryBar(),
              ),
              Container(
                height: 349,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Chat_Primary(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
