import 'package:cineapp/config/constants/enviroment.dart';
import 'package:cineapp/domain/datasources/movies_datasource.dart';
import 'package:cineapp/domain/entities/movie.dart';
import 'package:cineapp/infrastructure/mappers/movie_mapper.dart';
import 'package:cineapp/infrastructure/models/moviedb/movie_details.dart';
import 'package:cineapp/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MovieDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': 'Bearer ${Enviroment.theMovieDbToken}'
    }
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json){
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse
    .results
    .where((e)=> e.posterPath != 'no-poster')
    .map((e) => MovieMapper.movieDbToEntity(e)).toList();
    return movies;
  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      });

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async{
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page
    });
    return _jsonToMovies(response.data);
  }

    @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
    });
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async{
    final response = await dio.get('/movie/$id');
    final movieDB = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDtlsToEntity(movieDB);
  }
  
  @override
  Future<List<Movie>> searchMovies(Pattern query) async {
    final response = await dio.get('/search/movie',
      queryParameters: {
        'query': query
    });
    return _jsonToMovies(response.data);
  }
  
}