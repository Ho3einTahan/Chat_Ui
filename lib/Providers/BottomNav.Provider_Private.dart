import 'package:flutter/cupertino.dart';

class BottomNavProvider_Private extends ChangeNotifier {
  bool Visibitly = false;
  final TextEditingController SendBox = TextEditingController();
  final ScrollController controller = ScrollController();
  List titleList = [];
  onChange(value) {
    if (value.isEmpty == false) {
      Visibitly = true;
      notifyListeners();
    } else {
      Visibitly = false;
      notifyListeners();
    }
  }
  sendButton(){
    if(SendBox.text!= "") {
      Visibitly = false;
        titleList!.add(SendBox.text);
        SendBox.clear();
        controller!.animateTo(
            controller!.position.maxScrollExtent +
                250,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeIn);
            notifyListeners();
    }
  }
}
