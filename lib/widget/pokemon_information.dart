import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/uii_helper.dart';

import '../model/pokemon_model.dart';

class PokemonInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
      ),
      child: Padding(
        padding: Uihelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buidInformationRow("Name", pokemon.name),
            _buidInformationRow("Height", pokemon.height),
            _buidInformationRow("Weight", pokemon.weight),
            _buidInformationRow("Spawn Time", pokemon.spawnTime),
            _buidInformationRow("Weaknesses", pokemon.weaknesses),
            _buidInformationRow("Pre Evolution", pokemon.prevEvolution),
            _buidInformationRow("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buidInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokemonInfoLabelTextStyle(),
        ),
        buildText(value),
      ],
    );
  }

  Widget buildText(dynamic value) {
    if (value is List && value.isNotEmpty) {
      return Text(
        value.join(" , "),
        style: Constants.getPokemonInfoTextStyle(),
      );
    } else if (value == null || value == [] || value.isEmpty) {
      return Text(
        "Not available",
        style: Constants.getPokemonInfoTextStyle(),
      );
    } else {
      return Text(
        value.toString(),
        style: Constants.getPokemonInfoTextStyle(),
      );
    }
  }
}
