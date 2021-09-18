part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();
}

class MovieCarouselInitial extends MovieCarouselState {
  @override
  List<Object> get props => [];
}

class MovieCarouselError extends MovieCarouselState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, "defaultIndex must be positive");

  @override
  // TODO: implement props
  List<Object?> get props => [movies, defaultIndex];
}
