import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/datasources/movie_remote_data_source.dart';

void main() async {
  Client client = Client();
  MovieRemoteDataSourceImpl datasource = MovieRemoteDataSourceImpl(client);
  await datasource.getTrending();

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
