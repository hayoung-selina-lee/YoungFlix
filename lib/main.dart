import 'package:flutter/material.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';

void main() {
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
                Container(
                  child: const Center(
                    child: Text('home'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('search'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('save'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('more'),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const Bottom(),
          ),
        ));
  }
}
