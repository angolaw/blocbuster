import 'package:blocbuster/data/core/api_client.dart';
import 'package:blocbuster/data/datasources/movie_remote_data_source.dart';
import 'package:blocbuster/data/repositories/movie_repository_impl.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/get_coming_soon.dart';
import 'package:blocbuster/domain/usecases/get_playing_now.dart';
import 'package:blocbuster/domain/usecases/get_popular.dart';
import 'package:blocbuster/domain/usecases/get_trending.dart';
import "package:get_it/get_it.dart";
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //initialize the Http Client dependency
  getItInstance.registerLazySingleton<Client>(() => Client());
  //initialize ApiClient dependency using upwards compatibility
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  //initialize movieRemoteDataSource dependency using up compatibility
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  //register MovieRepository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  //initialize UseCases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
}
