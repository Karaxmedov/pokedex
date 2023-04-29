import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];
    var response = await Dio().get(_url);
    var pokemonList = jsonDecode(response.data)["pokemon"];
    if (pokemonList is List) {
      _list = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }
    return _list;
  }
}
