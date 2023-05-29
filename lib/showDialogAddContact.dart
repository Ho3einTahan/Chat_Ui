import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

showDialogAddContact(BuildContext context) {
  TextDirection direction = TextDirection.rtl;
  TextEditingController TxtName = TextEditingController();
  TextEditingController TxtFamily = TextEditingController();
  TextEditingController TxtPhoneNumber = TextEditingController();
  TextEditingController ImageName = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Directionality(
              textDirection: direction,
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: TxtName,
                  decoration: InputDecoration(
                    label: Text("نام"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Directionality(
              textDirection: direction,
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: TxtFamily,
                  decoration: InputDecoration(
                    label: Text("نام خانوادگی"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Directionality(
              textDirection: direction,
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: TxtPhoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text("شماره تماس"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Directionality(
              textDirection: direction,
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: ImageName,
                  decoration: InputDecoration(
                    label: Text("عکس"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Center(
            child: Text(
          "اضافه کردن مخاطب جدید",
          style: TextStyle(fontSize: 18),
        )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("انصراف"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(70, 34),
                ),
                onPressed: () {
                  AddContact(TxtName, TxtFamily, TxtPhoneNumber, ImageName);
                },
                child: Text("اضافه"),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void AddContact(TxtName, TxtFamily, TxtPhoneNumber,ImageName) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('Name', TxtName.text);
  preferences.setString('Family', TxtFamily.text);
  preferences.setInt('PhoneNumber', int.parse(TxtPhoneNumber.text));
  preferences.setString('ImageName', ImageName.text);
  // ,namelist,familylist,imagelist,phonenumberlist
}
