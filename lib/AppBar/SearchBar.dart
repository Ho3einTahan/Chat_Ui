import 'package:flutter/material.dart';
class SearchBar extends StatefulWidget {
   SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30, top: 8, right: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      child: IconButton(onPressed: () {

      }, icon:Icon(Icons.search_sharp,color: Colors.black),),
    );
  }
}
