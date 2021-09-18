part of 'movie_carousel/movie_carousel_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();
}
class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  CarouselLoadEvent({this.defaultIndex = 0}):assert(defaultIndex >= 0, "Index can't be negative");

  @override
  // TODO: implement props
  List<Object?> get props => [defaultIndex];



}
