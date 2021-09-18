import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MoviePageView extends StatelessWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
