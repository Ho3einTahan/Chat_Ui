import 'package:flutter/material.dart';

PreferredSizeWidget AppBar_Chat(
    BuildContext context, String name, String image,String OfflineState) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xffeee8e8),
    toolbarHeight: 130,
    leading:  Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CircleAvatar(
        backgroundColor:Colors.grey.shade50,
        child:IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
    ),
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
              OfflineState,
              style: TextStyle(
                color: Colors.green.shade300,
              ),
            )),
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 25,bottom: 25,right: 10),
        child: CircleAvatar(
          radius: 40,
          backgroundImage:AssetImage("images/${image}.jpg"),
        ),
      ),
    ],
  );
}
