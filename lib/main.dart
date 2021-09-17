import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

import 'di/get_it.dart' as getIt;
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  unawaited(getIt.init());
  GetTrending getTrendingUseCase = getIt.getItInstance<GetTrending>();
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrendingUseCase(NoParams());
  eitherResponse.fold(
      (l) => {print("Error : $l")}, (r) => {print("Success: $r")});
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
