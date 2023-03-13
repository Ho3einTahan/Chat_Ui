import 'package:chat_ui/Constant/MyDataList.dart';
import 'package:flutter/material.dart';

import 'Chat_Primary.dart';
import 'Chat_Private.dart';

class CustomSearch_Chat extends SearchDelegate {
  List<String> title = [
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
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var title in title) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }

    return ListView.separated(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) =>
          InkWell(
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
              child: ChatItem(index, title)),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var title in title) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }

    return ListView.separated(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) =>
         InkWell(
           onTap: () {
             FocusScope.of(context).unfocus();
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
             child: ChatItem(index, title)),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

Widget ChatItem(int index,List Title) {
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