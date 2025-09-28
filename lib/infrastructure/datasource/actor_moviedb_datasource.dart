import 'package:cineapp/config/constants/enviroment.dart';
import 'package:cineapp/domain/datasources/actors_datasource.dart';
import 'package:cineapp/domain/entities/actor.dart';
import 'package:cineapp/infrastructure/mappers/actor_mapper.dart';
import 'package:cineapp/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': 'Bearer ${Enviroment.theMovieDbToken}'
    }
  ));  

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');    
    final castResponse = CreditsResponse.fromJson(response.data);
    return castResponse.cast.map( (cast) => ActorMapper.castToEntity(cast)).toList();
  }

}