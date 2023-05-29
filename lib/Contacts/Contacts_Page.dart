import 'package:chat_ui/Providers/AddContact.Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'CustomeSearch_Contact.dart';

class Contacts_Page extends StatelessWidget {
  Contacts_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addContact_Provider = Provider.of<AddContact_Provider>(context);
    addContact_Provider.LoadFamily();
    addContact_Provider.LoadImageName();
    addContact_Provider.LoadName();
    addContact_Provider.LoadPhoneNumber();
    addContact_Provider.itemCount();
    print("item count is : ${addContact_Provider.itemcount!}");
    return Scaffold(
      //  appBar: searchBar(ContactsProvider, context),
      body: ListView.separated(
        shrinkWrap: false,
        itemCount: addContact_Provider.itemCount()!,
        itemBuilder: (context, index) {
          return ContactItem(index, context, addContact_Provider);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}

PreferredSizeWidget searchBar(ContactsProvider, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.grey.shade50,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearch_Contact());
          },
          icon: Icon(Icons.search, size: 30, color: Colors.black),
        ),
      ),
    ],
  );
}

Widget ContactItem(int index, BuildContext context, addContact_Provider) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage:
      AssetImage("images/${addContact_Provider.imagename[index]}.jpg"),
    ),
    title: Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text(addContact_Provider.name[index])),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  launchUrlString(
                      "sms://${addContact_Provider.phonenumber[index]}");
                },
                icon: Icon(Icons.sms,
                    color: Colors.grey.shade500, size: 27),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  launchUrlString(
                      "tel://${addContact_Provider.phonenumber[index]}");
                },
                icon: Icon(Icons.call,
                    color: Colors.green.shade500, size: 27),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
