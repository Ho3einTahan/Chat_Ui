import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Contacts_Page extends StatefulWidget {
  const Contacts_Page({Key? key}) : super(key: key);

  @override
  State<Contacts_Page> createState() => _Contacts_PageState();
}
List<String> HelpContact=[];
class _Contacts_PageState extends State<Contacts_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      body: ListView.separated(
        shrinkWrap: false,
        itemCount: Title.length,
        itemBuilder: (context, index) {
          return ContactItem(index, context);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }

  PreferredSizeWidget searchBar() {
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
          child: TextField(
            onChanged: (value) {
              Search_Contact(value);
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
          ),
        ),
      ),
    );
  }

  void Search_Contact(String KeyWord) {
    List<String> ContactsName = [];
    if(Title.length>=8) {
     setState(() {
       HelpContact = Title;
     });
    }
    if (KeyWord.isEmpty) {
      setState(() {
        Title = HelpContact;
        print(Title);
      });
    }
    ContactsName = Title.where((element) {
      return element.contains(KeyWord);
    }).toList();
    setState(() {
      Title = ContactsName;
    });
  }
}

List<String> DataImage = [
  "story_1",
  "story_2",
  "story_3",
  "story_4",
  "story_5",
  "story_6",
  "story_7",
  "story_8",
  "story_9",
  "story_10"
];
List<String> Title = [
  "حسین طحان",
  "معین باغشیخی",
  "امین یزدان دوست",
  "محمد مقدم",
  "مهدی حبیبی زاده",
  "مانی تاریخ",
  "آرش جعفری",
  "سینا زین ساز",
  "علی جوشقانی",
  "عرفان کچویی"
];

Widget ContactItem(int index, BuildContext context) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage("images/${DataImage[index]}.jpg"),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text(Title[index])),
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
