import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widget/pokemon_list_item.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  late Future<List<PokemonModel>> _list;
  @override
  void initState() {
    _list = PokedexApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> pokemonList = snapshot.data!;
          return GridView.builder(
            itemCount: pokemonList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (context, index) {
              return PokemonListItem(pokemon: pokemonList[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
