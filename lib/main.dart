import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/core/api_client.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  Client client = Client();
  ApiClient apiClient = ApiClient(client);
  MovieRemoteDataSourceImpl datasource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository repository = MovieRepositoryImpl(datasource);
  GetTrending getTrending = GetTrending(repository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending();
  eitherResponse.fold(
      (l) => {print('Error: $l')}, (r) => {print("Success: $r")});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.red,
      ),
    );
  }
}
