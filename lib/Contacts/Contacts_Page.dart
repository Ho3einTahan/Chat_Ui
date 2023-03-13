import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Providers/Contacts.Provider.dart';
import 'CustomeSearch_Contact.dart';

class Contacts_Page extends StatelessWidget {
  const Contacts_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactsProvider=Provider.of<Contacts_Provider>(context);
    return  Scaffold(
          appBar: searchBar(ContactsProvider,context),
          body: ListView.separated(
            shrinkWrap: false,
            itemCount: ContactsProvider.Title.length,
            itemBuilder: (context, index) {
              return ContactItem(index, context, ContactsProvider);
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
          ),
        );
      }
  }

  PreferredSizeWidget searchBar(ContactsProvider,BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade50,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(onPressed: () {
            showSearch(context: context, delegate:CustomSearch_Contact() );
          }, icon: Icon(Icons.search,size: 30,color: Colors.black),),
        ),
      ],
    );
  }

Widget ContactItem(int index, BuildContext context, ContactsProvider) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage:
          AssetImage("images/${ContactsProvider.DataImage[index]}.jpg"),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text(ContactsProvider.Title[index])),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  launchUrlString("sms://${09135682958}");
                },
                icon: Icon(Icons.sms, color: Colors.grey.shade500, size: 27),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  launchUrlString("tel://${09135682958}");
                },
                icon: Icon(Icons.call, color: Colors.green.shade500, size: 27),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
