import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';

class GetTrending {
  final MovieRepository repository;
  GetTrending(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getTrending();
  }
}
