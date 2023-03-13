import 'package:chat_ui/AppBar/ProfileImage.dart';
import 'package:chat_ui/AppBar/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppBarPrimary() {
  return AppBar(
    elevation: 0,
    leadingWidth: 147,
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
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
    ),
    actions: [
      SearchBar(),
      ProfileImage(),
    ],
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "GoodMorning",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Alissya Octavia",
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

