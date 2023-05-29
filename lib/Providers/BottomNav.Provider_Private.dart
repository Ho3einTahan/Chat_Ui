import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavProvider_Private extends ChangeNotifier {
  bool Visibitly = false;
  final TextEditingController SendBox = TextEditingController();
  final ScrollController controller = ScrollController();
  List<String> titleList = [];
  SharedPreferences? preferences;
  List<String> loaddata = [];
  int? itemcount;

  onChange(value) {
    if (value.isEmpty == false) {
      Visibitly = true;
      notifyListeners();
    } else {
      Visibitly = false;
      notifyListeners();
    }
  }

  sendButton() {
    if (SendBox.text != "") {
      Visibitly = false;
      titleList!.add(SendBox.text);
      SendBox.clear();
      SaveData();
      controller!.jumpTo(controller!.position.maxScrollExtent + 500);
      notifyListeners();
    }
  }

  SaveData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setStringList('ChatMessage', titleList);
  }

  LoadData() async {
    final preferences = await SharedPreferences.getInstance();
    final List<String>? mylist = preferences.getStringList('ChatMessage');
    List<String>? text = mylist;
    loaddata = text!;
    notifyListeners();
  }

  itemCount() async {
    final preferences = await SharedPreferences.getInstance();
    final List<String>? mylist = preferences.getStringList('ChatMessage');
    final int count = mylist!.length;
    itemcount = count;
    notifyListeners();
  }
}
