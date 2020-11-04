import 'package:flutter/material.dart';
import 'home_movie_item.dart';
import 'home_request.dart';
import '../model/home_model.dart';

class DBHomeContent extends StatefulWidget {
  @override
  _DBHomeContentState createState() => _DBHomeContentState();
}

class _DBHomeContentState extends State<DBHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    HomeRequest.getMovieList().then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        MovieItem movie = movies[index];
        movie.rank = index + 1;
        return DBHomeMovieItem(movie);
      },
    );
  }
}