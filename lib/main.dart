import 'package:chat_ui/Intro/SplashScreen.dart';
import 'package:chat_ui/Providers/AddContact.Provider.dart';
import 'package:chat_ui/Providers/BottomNav.Provider_Primary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNav/BottomNavPrimary.dart';
import 'Chat/Chat_Primary.dart';
import 'Contacts/Contacts_Page.dart';
import 'Providers/BottomNav.Provider_Private.dart';
import 'Providers/Contacts.Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Primary()),
      ChangeNotifierProvider(create: (context) => Contacts_Provider()),
      ChangeNotifierProvider(create: (context) => BottomNavProvider_Private()),
      ChangeNotifierProvider(create: (context) => AddContact_Provider()),
    ], child: Application()),
  );
}

class Splash extends StatelessWidget {
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
