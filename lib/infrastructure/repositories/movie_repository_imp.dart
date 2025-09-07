
import 'package:cineapp/domain/datasources/movies_datasource.dart';
import 'package:cineapp/domain/entities/movie.dart';
import 'package:cineapp/domain/repositories/movies_datasource.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page:page);
  }

}