

import 'package:cineapp/infrastructure/datasource/actor_moviedb_datasource.dart';
import 'package:cineapp/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});