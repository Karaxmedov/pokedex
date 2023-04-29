import 'package:flutter/material.dart';
import 'package:pokedex/widget/app_title.dart';
import 'package:pokedex/widget/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonListWidget()),
          ],
        ),
      ),
    );
  }
}
