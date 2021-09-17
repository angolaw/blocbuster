import 'package:blocbuster/data/datasources/movie_remote_data_source.dart';
import 'package:blocbuster/data/models/movie_model.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } on Exception {
      return null;
    }
  }
}
