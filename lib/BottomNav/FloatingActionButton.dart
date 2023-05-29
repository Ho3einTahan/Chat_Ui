import 'package:chat_ui/showDialogAddContact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonPrimary extends StatelessWidget {
  FloatingActionButtonPrimary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogAddContact(context);
      },
      child: Container(
        width: 170,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.add, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "Add Friends",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
