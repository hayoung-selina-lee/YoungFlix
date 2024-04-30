import 'package:flutter/material.dart';
import 'dart:ui';

import '../model/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen(this.movie, {super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();

    like = widget.movie.like; // like status about this movie.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                // + Blur effect on poster.
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/${widget.movie.poster}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          // Blur effect on poster. +

                          // + origin poster
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  height: 300,
                                  child: Image.asset(
                                      'images/${widget.movie.poster}'),
                                ),
                                // origin poster +

                                // + one line information
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  child: const Text(
                                    '99% Match 2019 15+ Season 1개',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                // one line information +

                                // + display title
                                Container(
                                  padding: const EdgeInsets.all(7),
                                  child: Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                // display title +

                                // + play button
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.play_arrow),
                                        Text('Play'),
                                      ],
                                    ),
                                  ),
                                ),
                                // play button +

                                // + display information
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(widget.movie.toString()),
                                ),
                                // display information +

                                // + Cast Information
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                      'Cast: HyunBin, YeJinSon, JiHyeSeo\nDirector: JeongHoLee, JiEunPark',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                // Cast Information +
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // + Add Exit button(X)
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  // Add Exit button(X) +
                ],
              ),

              // + Make Menu Buttons
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // + Add Liked Content button
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            like
                                ? const Icon(Icons.check)
                                : const Icon(Icons.add),
                            const Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            const Text(
                              'Liked Content',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Add Liked Content button +

                    // + Add Rating button
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: const Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Add Rating button +

                    // + Add Share button
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                          child: const Column(
                        children: <Widget>[
                          Icon(Icons.send),
                          Padding(padding: EdgeInsets.all(5)),
                          Text('Share',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60))
                        ],
                      )),
                    ),
                    // Add Share button +
                  ],
                ),
              ),
              // Make Menu Buttons +
            ],
          ),
        ),
      ),
    );
  }
}
