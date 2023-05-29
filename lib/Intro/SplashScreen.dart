
import 'dart:async';

import 'package:chat_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed( Duration(seconds:8)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) =>  Application()));
    });
  }
  final spinkit = SpinKitFadingCircle(
   color:  Color(0xaaCBF1FA),
    size: 60,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffCBF1FA),
                  Color(0xffCCF6B4),
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: [
                Stack(
                  children: [
                    Image.asset("images/splash.png"),
                    Positioned(
                        top: 250,
                        left: 180,
                        child: spinkit),

                  ],
                ),
                  Text("Welcome To KDIP...",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
