

import 'package:cineapp/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cineapp/infrastructure/repositories/movie_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(MoviedbDatasource());
});