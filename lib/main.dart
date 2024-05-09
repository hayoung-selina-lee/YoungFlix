import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/more_screen.dart';
import 'package:netflix_clone/screen/search_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YoungFlix',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.black,
            secondaryHeaderColor: Colors.white),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics:
                  const NeverScrollableScrollPhysics(), // block to swipe by user's touch motion.
              children: <Widget>[
                // put screent for displaying to children.
                const HomeScreen(),
                const SearchScreen(),
                Container(
                  child: const Center(
                    child: Text('save'),
                  ),
                ),
                const MoreScreen(),
              ],
            ),
            bottomNavigationBar: const Bottom(),
          ),
        ));
  }
}
