import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/app/common/const/api_consts.dart';
import 'package:pokedex/app/common/errors/error.dart';
import 'package:pokedex/app/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await dio.get(ApiConsts.pokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Error(message: 'Não foi possivel carregas todos pokemons');
    }
  }
}
