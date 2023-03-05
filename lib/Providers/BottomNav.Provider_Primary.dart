import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../Chat/Chat_Primary.dart';
import '../Contacts/Contacts_Page.dart';

class BottomNavProvider_Primary extends ChangeNotifier {
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
