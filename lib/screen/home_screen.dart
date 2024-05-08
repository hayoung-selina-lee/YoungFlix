import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

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

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movie').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LinearProgressIndicator(); // show loading screen
          }
          return _buildBody(context, snapshot.data!.docs);
        });
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();

    return ListView(children: <Widget>[
      Stack(children: <Widget>[CarouseImage(movies: movies), const TopBar()]),
      CircleSlider(movies),
      BoxSlider(movies)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
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
              Image.asset('images/bbongflix_logo.png',
                  fit: BoxFit.contain, height: 25),
              Container(
                  padding: const EdgeInsets.only(right: 1),
                  child: const Text(
                    'TV Program',
                    style: TextStyle(fontSize: 14),
                  )),
              Container(
                  padding: const EdgeInsets.only(right: 1),
                  child: const Text(
                    'Movie',
                    style: TextStyle(fontSize: 14),
                  )),
              Container(
                padding: const EdgeInsets.only(right: 1),
                child: const Text(
                  'Liked Content',
                  style: TextStyle(fontSize: 14),
                ),
              )
            ]));
  }
}
