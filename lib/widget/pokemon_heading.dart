import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';

import '../constants/uii_helper.dart';
import '../model/pokemon_model.dart';

class PokemonHeading extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonHeading({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
              Text(
                "#${pokemon.num}",
                style: Constants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Chip(
            label: Text(
              pokemon.type?.join(" , ") ?? "",
              style: Constants.getTypechipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
