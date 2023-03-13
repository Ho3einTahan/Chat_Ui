import 'package:flutter/material.dart';

import '../Chat/CustomSearch_Chat.dart';
import '../Contacts/CustomeSearch_Contact.dart';
class SearchBar extends StatelessWidget {
   SearchBar({Key? key}) : super(key: key);

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
        showSearch(context: context, delegate:CustomSearch_Chat() );
      }, icon:Icon(Icons.search_sharp,color: Colors.black),),
    );
  }
}
