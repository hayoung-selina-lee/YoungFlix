import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/screen/detail_screen.dart';

// StatefulWidget : not only showing a image, but also like button and detail information.
class CarouseImage extends StatefulWidget {
  final List<Movie> movies;
  const CarouseImage({super.key, required this.movies});

  @override
  _CarouseImageState createState() => _CarouseImageState();
}

class _CarouseImageState extends State<CarouseImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  int _currentPage = 0; // current content
  String _currentKeyword = "";

  @override
  void initState() {
    super.initState();

    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();

    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.all(20),
      ),
      CarouselSlider(
        items: images,
        options: CarouselOptions(onPageChanged: (index, reason) {
          setState(() {
            _currentPage = index;
            _currentKeyword = keywords[_currentPage];
          });
        }),
      ),
      Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(_currentKeyword, style: const TextStyle(fontSize: 11))),

      // menu bar
      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            // Like button
            Container(
                child: Column(children: <Widget>[
              likes[_currentPage]
                  ? IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        setState(() {
                          likes[_currentPage] = !likes[_currentPage];
                          movies[_currentPage]
                              .reference
                              .update({'like': likes[_currentPage]});
                        });
                      })
                  : IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          likes[_currentPage] = !likes[_currentPage];
                          movies[_currentPage]
                              .reference
                              .update({'like': likes[_currentPage]});
                        });
                      }),
              const Text('Liked Content', style: TextStyle(fontSize: 11))
            ])),

            // Play button
            Container(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.play_arrow, color: Colors.black),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        'Play',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )),

            // Information button
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {
                      // + Move to Detail Screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              DetailScreen(movies[_currentPage]),
                        ),
                      );
                      // Move to Detail Screen +
                    },
                  ),
                  const Text('Information', style: TextStyle(fontSize: 11))
                ],
              ),
            ),
          ])),

      // Indicator
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: makeIndicator(likes, _currentPage),
      ))
    ]));
  }
}

// Indicator
List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i
              ? const Color.fromRGBO(255, 255, 255, 0.9)
              : const Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return results;
}
