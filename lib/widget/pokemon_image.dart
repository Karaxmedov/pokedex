import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/model/pokemon_model.dart';

import '../constants/uii_helper.dart';

class PokemonImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonImage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            Constants.imagePath,
            width: Uihelper.caculatePokemonImageSize(),
            height: Uihelper.caculatePokemonImageSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              imageUrl: pokemon.img?.toString() ?? "",
              width: Uihelper.caculatePokemonImageSize(),
              height: Uihelper.caculatePokemonImageSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) {
                return const CircularProgressIndicator(
                  color: Colors.black,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
