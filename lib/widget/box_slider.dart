import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

import '../screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  const BoxSlider(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Popular on Netflix'),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeBoxImages(context, movies),
              ),
            )
          ],
        ));
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];

  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
        onTap: () {
          // + Move to Detail Screen
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => DetailScreen(movies[i]),
            ),
          );
          // Move to Detail Screen +
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
              alignment: Alignment.center,
              child: Image.asset('images/${movies[i].poster}')),
        )));
  }

  return results;
}
