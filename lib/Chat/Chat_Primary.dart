import 'package:chat_ui/AppBar/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../AppBar/AppBarPrimary.dart';
import '../BottomNav/FloatingActionButton.dart';
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
                height: 110,
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
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
                child: Container(
                  height: CallBackHeightScreen(heightscreen),
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
                                        name: Title[index],
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
                index % 3 == 0 ? getBoxOnline() : getBoxOffline(),
              ],
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(Title[index], textDirection: TextDirection.rtl),
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
                        : getBoxOffline(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double CallBackHeightScreen(double heightScreen) {
    if (heightScreen == 816) {
      return heightScreen * 0.59;
    } else if (heightScreen <= 816 && heightScreen>780) {
      return heightScreen * 0.58;
    }
    else if (heightScreen >= 600 && heightScreen<780) {
      return heightScreen * 0.51;
    }
    return 0;
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

  Widget getBoxOffline() {
    return Container(
      color: Colors.transparent,
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

List<String> DataImage = [
  "story_1",
  "story_2",
  "story_3",
  "story_4",
  "story_5",
  "story_6",
  "story_7",
  "story_8",
  "story_9",
  "story_10"
];

List<String> Title = [
  "حسین طحان",
  "معین باغشیخی",
  "امین یزدان دوست",
  "محمد مقدم",
  "مهدی حبیبی زاده",
  "مانی تاریخ",
  "آرش جعفری",
  "سینا زین ساز",
  "علی جوشقانی",
  "عرفان کچویی"
];

List<String> SubTitle = [
  "سلام خوبی؟ چه خبر",
  "فردا کلاس میای",
  "دلار شد 50 هزار تومن",
  "فارسی درس چند رو باید بنویسیم؟",
  " Figmaمحدودیت دسترسی داره",
  "فیلتر شکن های سامان کار نمیکنه",
  "طاهر آباد نرفتی؟",
  "فردا میبینمت",
  "فرانتت قشنگ بود احسنت",
  "فردا بیا سالن"
];

List<String> MessaegeTime = [
  "14:32",
  "18:12",
  "17:11",
  "یک دقیقه پیش",
  "پنج دقیقه پیش",
  "11:21",
  "10:30",
  "دیروز",
  "آخرین بازدید به تازگی",
  "سال گذشته"
];

List<String> CountMessage = [
  "3",
  "4",
  "8",
  "10",
  "1",
  "3",
  "2",
  "12",
  "100",
  "5",
  "9",
  "1",
  "12"
];
