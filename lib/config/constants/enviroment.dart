import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  
  static String theMovieDbKey = dotenv.env['API_KEY_TMDB'] ?? 'Theres no API KEY';
  static String theMovieDbToken = dotenv.env['API_TOKEN'] ?? 'Theres no API TOKEN';

}
