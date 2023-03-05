import 'package:chat_ui/Providers/BottomNav.Provider_Primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomNav/BottomNavPrimary.dart';
import 'Providers/BottomNav.Provider_Private.dart';
import 'Providers/Contacts.Provider.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Primary()),
      ChangeNotifierProvider(create: (context) => Contacts_Provider()),
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Private()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final BottomNavProvider = Provider.of<BottomNavProvider_Primary>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:BottomNavProvider.ScreenReturn(),
          bottomNavigationBar: BottomNavPrimary(),
        ),
      );
    },);

  }
}
