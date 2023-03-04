
import 'package:chat_ui/AppBar/Appbar_Chat_Private.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Chat_Private extends StatefulWidget {
  Chat_Private(
      {Key? key, required this.name, required this.image, required this.Title})
      : super(key: key);
  String? name;
  String? image;
  String? Title;@override
  State<Chat_Private> createState() => _Chat_PrivateState();
}

class _Chat_PrivateState extends State<Chat_Private> {
  bool Visibitly = false;
  final TextEditingController SendBox = TextEditingController();
  final ScrollController controller = ScrollController();
  Color MickColor = Colors.grey.shade100;
  String name = "";
  String image = "";
  String title = "";
  List titleList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name!;
    image = widget.image!;
    title = widget.Title!;
    titleList = [title];
  }
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavPrivate(),
      backgroundColor: Color(0xffececec),
      appBar: AppBar_Chat(context, name, image),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: heightScreen * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          child: ListView.builder(
            controller: controller,
            itemCount: titleList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SendMessage(titleList[index]),
                  ResendMessage(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  Widget ResendMessage(){
    return Padding(
      padding: const EdgeInsets.only(right: 130, left: 10, top: 10, bottom: 10),
      child: ClipPath(
        clipper: UpperNipMessageClipper(MessageType.receive),
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          color: Color(0xffCCF6C4),
          child: Column(
            children: [
              Text("سلام به درک", textAlign: TextAlign.right),
              Row(
                children: [
                  Spacer(),
                  Text("12:20"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget SendMessage(String TextMessage) {
    return Padding(
      padding: const EdgeInsets.only(left: 130, top: 10, right: 10),
      child: ClipPath(
        clipper: LowerNipMessageClipper(MessageType.send),
        child: Container(
          padding:const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
          color: Color(0xffCCF1FA),
          child: Column(
            children: [
              Text(TextMessage),
              Row(
                children: [
                  Spacer(),
                  Text(DateTime.now().hour.toString() + ":"),
                  Text(DateTime.now().minute.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BottomNavPrivate() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  controller: SendBox,
                  minLines: 1,
                  maxLines: 3,
                  onChanged: (value) {
                    if (value.isEmpty == false) {
                      setState(() {
                        Visibitly = true;
                      });
                    } else {
                      setState(() {
                        Visibitly = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Visibility(
                          visible: Visibitly,
                          child: GestureDetector(
                              onTap: () {
                                if (SendBox.text != "") {
                                  setState(() {
                                    titleList!.add(SendBox.text);
                                    SendBox.clear();
                                    controller!.animateTo(
                                        controller!.position.maxScrollExtent +
                                            250,
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeIn);
                                  });
                                }
                              },
                              child: Icon(Icons.send_sharp))),
                    ),
                    /////
                    ////
                    ////
                    prefixIcon: GestureDetector(
                        onTap: () {
                        },
                        child: Icon(CupertinoIcons.paperclip, size: 28)),
                    /////
                    ////
                    /////
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: "Type a Message",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: MickColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        MickColor = Colors.blue;
                      });

                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        MickColor = Colors.grey.shade100;
                      });
                    },
                    child: Icon(FontAwesomeIcons.microphone)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

