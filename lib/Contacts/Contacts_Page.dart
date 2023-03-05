import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Providers/Contacts.Provider.dart';

class Contacts_Page extends StatelessWidget {
  const Contacts_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactsProvider=Provider.of<Contacts_Provider>(context);
    return  Scaffold(
          appBar: searchBar(ContactsProvider),
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

  PreferredSizeWidget searchBar(ContactsProvider) {
    return AppBar(
      backgroundColor: Colors.grey.shade50,
      elevation: 0,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        height: 45,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Consumer<Contacts_Provider>(builder: (context, ContactsProvider, child) {
            return TextField(
              onChanged: (value) {
                ContactsProvider.Search_Contact(value);
                print(value);
              },
              decoration: InputDecoration(
                hintText: "مخاطب خود را پیدا کنید.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              ),
            );
          },),
        ),
      ),
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
