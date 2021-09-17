import 'package:blocbuster/data/datasources/movie_remote_data_source.dart';
import 'package:blocbuster/data/models/movie_model.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return const Left(AppError("Something went wrong"));
    }
  }
}
