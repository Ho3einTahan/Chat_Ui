import 'package:chat_ui/BottomNav_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomNav/BottomNavPrimary.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNav_Provider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final BottomNavProvider = Provider.of<BottomNav_Provider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:BottomNavProvider.ScreenReturn(),
        bottomNavigationBar: BottomNavPrimary(),
          ),
    );
  }
}
