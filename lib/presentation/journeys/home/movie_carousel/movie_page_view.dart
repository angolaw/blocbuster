import 'package:blocbuster/common/constants/sizes.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/common/screenutil/screen_util.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      height: ScreenUtil().screenHeight * 0.35,
      child: PageView.builder(
          pageSnapping: true,
          itemCount: widget.movies.length,
          onPageChanged: (index) {},
          controller: _pageController,
          itemBuilder: (context, index) {
            final MovieEntity movie = widget.movies[index];
            return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieId: movie.id,
              posterPath: movie.posterPath,
            );
          }),
    );
  }
}
