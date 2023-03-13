import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../AppBar/AppBarPrimary.dart';
import '../BottomNav/FloatingActionButton.dart';
import '../Constant/MyDataList.dart';
import 'Chat_Private.dart';
import '../AppBar/GetStoryBar_Users.dart';

class Chat_Primary extends StatelessWidget {
  Chat_Primary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xffCBF1FA),
              Color(0xffEDFAF8),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButtonPrimary(),
          appBar: AppBarPrimary(),
          body: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffCBF1FA),
                      Color(0xffCCF6B4),
                      Color(0xffEDFAF8),
                    ],
                  ),
                ),
                child: getStoryBar(),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      itemCount: DataImage.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Chat_Private(
                                          image: DataImage[index],
                                          name: title[index],
                                          Title: SubTitle[index],
                                          OfflineState: index % 3 == 0
                                              ? "Online"
                                              : "Offline",
                                        )),
                              );
                            },
                            child: ChatItem(index));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ChatItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset("images/${DataImage[index]}.jpg",
                        width: 60, height: 60),
                  ),
                ),
                index % 3 == 0 ? getBoxOnline() : Offstage(),
              ],
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title[index], textDirection: TextDirection.rtl),
                    Text(
                      SubTitle[index],
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MessaegeTime[index]),
                    SizedBox(height: 5),
                    index % 4 == 0
                        ? getBoxMessage(CountMessage[index])
                        : Offstage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBoxOnline() {
    return Positioned(
      top: 8,
      right: 2,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }

  Widget getBoxMessage(String CountMessage) {
    return Container(
      width: 35,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text(CountMessage)),
    );
  }
}

