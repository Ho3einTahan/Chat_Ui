import 'package:flutter/cupertino.dart';

class Contacts_Provider extends ChangeNotifier {
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
    "حسین gطحان",
    "معین بhاغشیخی",
    "امین یزدان دوست",
    "محمد مقدم",
    "مهدی حبیبی زاده",
    "مانی تاریخ",
    "آرش جعفری",
    "سینا زین ساز",
    "علی جوشقانی",
    "عرفان کچویی"
  ];
  List<String> HelpContact = [];

  void Search_Contact(String KeyWord) {
    List<String> ContactsName = [];
    if (Title.length >= 8) {
      HelpContact = Title;
      notifyListeners();
    }
    if (KeyWord.isEmpty) {
      Title = HelpContact;
      print(Title);
      notifyListeners();
    }
    ContactsName = Title.where((element) {
      return element.contains(KeyWord);
    }).toList();

    Title = ContactsName;
    notifyListeners();
  }

}
