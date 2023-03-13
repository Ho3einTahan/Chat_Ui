import 'package:chat_ui/Intro/SplashScreen.dart';
import 'package:chat_ui/Providers/BottomNav.Provider_Primary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomNav/BottomNavPrimary.dart';
import 'Chat/Chat_Primary.dart';
import 'Contacts/Contacts_Page.dart';
import 'Providers/BottomNav.Provider_Private.dart';
import 'Providers/Contacts.Provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Primary()),
      ChangeNotifierProvider(create: (context) => Contacts_Provider()),
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Private()),
    ], child: SplashScreen()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<BottomNavProvider_Primary>(
        builder: (context, BottomNavProvider, child) {
          return Scaffold(
            body: IndexedStack(
              index: BottomNavProvider.screenindex,
              children: [
                Chat_Primary(), Contacts_Page(),
              ],
            ),
            bottomNavigationBar: BottomNavPrimary(),
          );
        },
      ),
    );
  }
}
