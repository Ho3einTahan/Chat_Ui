import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact_Provider extends ChangeNotifier {
  List<String> name = [];
  List<String> family = [];
  List<int> phonenumber = [];
  List<String> imagename = [];
  int itemcount = 0;

  LoadName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.getString("Name").toString();
    this.name.add(name);
  }

  LoadPhoneNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var phonenumber = preferences.getString("PhoneNumber");
    this.phonenumber.add(int.parse(phonenumber.toString()));
  }

  LoadFamily() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String family = preferences.getString("Family").toString();
    this.family.add(family);
  }

  LoadImageName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String imagename = preferences.getString("ImageName").toString();
    this.imagename.add(imagename);
  }

  itemCount() {
    List<String> mylist = name;
    itemcount = mylist.length;}
}
