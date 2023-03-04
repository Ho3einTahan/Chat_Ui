import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'Chat/Chat_Primary.dart';
import 'Contact/Contacts_Page.dart';

class BottomNav_Provider extends ChangeNotifier {
  int index = 0;
  List Screen = [Chat_Primary(), Contacts_Page()];

  int get screenindex=>index;

  ontap(int value) {
    index = value;
    notifyListeners();
  }

  Widget get screenList=>Screen[index];
  ScreenReturn() {
   return Screen[screenindex];
  }

}
