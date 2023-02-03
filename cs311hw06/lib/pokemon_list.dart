import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PokemonList();
  }
}

class _PokemonList extends State<PokemonList> {
  int chooes = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  // set state for chooes one olny one pokemon
                  chooes = index + 1;
                  pokemonService.pokemonType(index + 1);
                });
              },
              child: chooes == index + 1 //conditon for chooes pokemon border
                  ? Container(
                      child: Image.network(genPokemonImageUrl(index + 1)),
                      decoration: BoxDecoration(border: Border.all(width: 3)))
                  : Container(
                      child: Image.network(genPokemonImageUrl(index + 1)),
                      decoration: BoxDecoration(border: Border.all(width: 0))),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
