import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/model/pokemon_details_model.dart';

import 'package:pokedex/model/pokemon_model.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<List> _getPoke() async {
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate =
          (httpClient) => httpClient..maxConnectionsPerHost = 20;
    var url = 'https://pokeapi.co/api/v2/pokemon?limit=150&offset=0';
    final response = await dio.get(url);
    return await response.data['results'];
  }

  Future<List<PokemonModel>> getPokemons() async {
    final list = await _getPoke();
    final pokemons = list.map((e) => PokemonModel.fromJson(e)).toList();
    return pokemons;
  }

  Future _getDetails(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  Future<PokemonDetailsModel> getPokemonDetails(String url) async {
    final Map<String, dynamic> detailsMap = await _getDetails(url);
    final details = PokemonDetailsModel.fromJson(detailsMap);
    return details;
  }
}
