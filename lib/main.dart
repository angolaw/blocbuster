import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/core/api_client.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';

void main() async {
  Client client = Client();
  ApiClient apiClient = ApiClient(client);
  MovieRemoteDataSourceImpl datasource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository repository = MovieRepositoryImpl(datasource);
  repository.getTrending();

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
