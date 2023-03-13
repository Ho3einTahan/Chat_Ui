import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendBox extends StatefulWidget {
  const SendBox({Key? key}) : super(key: key);

  @override
  State<SendBox> createState() => _SendBoxState();
}

class _SendBoxState extends State<SendBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 16),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.7),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: GestureDetector(
                    onLongPress: () {
                      setState(() {});
                    },
                    onLongPressEnd: (details) {},
                    child:
                        Icon(CupertinoIcons.camera_fill, color: Colors.white)),
              ),
              Expanded(
                flex: 6,
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    suffixIcon: Visibility(
                        child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(CupertinoIcons.ellipsis,
                                  color: Colors.white),
                            ))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: "Send message",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
