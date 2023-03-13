import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Constant/MyDataList.dart';

class CustomSearch_Contact extends SearchDelegate {
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
      itemBuilder: (context, index) => getListTile(context,matchQuery[index],DataImage[index]),
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
      itemBuilder: (context, index) => getListTile(context,matchQuery[index],DataImage[index]),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

Widget getListTile(BuildContext context,String Title,String DataImage) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage("images/${DataImage}.jpg"),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text(Title)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  launchUrlString("sms://${09135682958}");
                },
                icon: Icon(Icons.sms, color: Colors.grey.shade500, size: 27),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  launchUrlString("tel://${09135682958}");
                },
                icon: Icon(Icons.call, color: Colors.green.shade500, size: 27),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
