import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/uii_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/widget/pokemon_image.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonListItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: Uihelper.pokemonListItemborderRadius,
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: Uihelper.getCardColorfromType(pokemon.type?[0].toString() ?? ""),
        child: Padding(
          padding: Uihelper.getDefaultPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pokemon.name ?? "N/A",
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypechipTextStyle(),
                ),
              ),
              Expanded(
                child: PokemonImage(pokemon: pokemon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
