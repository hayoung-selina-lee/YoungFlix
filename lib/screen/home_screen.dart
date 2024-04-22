import 'package:flutter/material.dart';

/* 
TO ADD CONTENT
1. top bar : clearly on the movie poster

2. movie poster
  - movie information
  - like button

3. preview circle/square widget
*/

// StatefulWidge : to get movie information from backend
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const TopBar();
  }
}

// Top bar
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Image.asset(
            'images/bbongflix_logo.png', 
            fit: BoxFit.contain, 
            height: 25
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'TV Program',
              style: TextStyle(fontSize: 14),
            )
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'Movie',
              style: TextStyle(fontSize: 14),
            )
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'Liked Content',
              style: TextStyle(fontSize: 14),
            ),
          )
      ])
    );
  }
}