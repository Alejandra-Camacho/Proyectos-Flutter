import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  String _apiKey   = 'd96a6afeb155981b1a346a103df1cc1f';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta( Uri url ) async {

    final respuesta = await http.get( url );
    final decodeData = json.decode( respuesta.body );
    final peliculas = new Peliculas.fromJsonList( decodeData['results'] );
    
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https( _url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https( _url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language
    });
    
    return await _procesarRespuesta(url);
  }

}