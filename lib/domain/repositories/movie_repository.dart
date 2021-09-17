import 'package:blocbuster/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrending();
}
