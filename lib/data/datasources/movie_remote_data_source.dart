import 'package:blocbuster/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getTrending() {
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}
