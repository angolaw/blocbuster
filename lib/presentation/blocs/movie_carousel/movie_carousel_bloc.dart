import 'dart:async';

import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:blocbuster/domain/usecases/get_trending.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      moviesEither.fold((error) => MovieCarouselError(), (movies) {
        return MovieCarouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex);
      });
    }
  }
}
