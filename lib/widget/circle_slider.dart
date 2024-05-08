import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';

import '../screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  const CircleSlider(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(7),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Preview'),
              SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: makeCircleImages(context, movies),
                  ))
            ]));
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];

  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
        onTap: () {
          // + Move to Detail Screen
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (ontext) => DetailScreen(movies[i]),
            ),
          );
          // Move to Detail Screen +
        }, // clickable
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(movies[i].poster), radius: 48)),
        )));
  }

  return results;
}
