import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  int currentPokemon = 1;
  int pokeColor = 0XFF7AC74C;

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  Future<void> pokemonType(int index) async {
    currentPokemon = index; //get index
    PokemonInfo pokeType = await fetchPokemonInfo(currentPokemon);
    String types = pokeType.types[0]; //conditon for types of pokemon
    types == 'normal'
        ? pokeColor = 0XFFA8A77A
        : types == 'fire'
            ? pokeColor = 0XFFEE8130
            : types == 'water'
                ? pokeColor = 0XFF6390F0
                : types == 'electric'
                    ? pokeColor = 0XFFF7D02C
                    : types == 'grass'
                        ? pokeColor = 0XFF7AC74C
                        : types == 'ice'
                            ? pokeColor = 0XFF6390F0
                            : types == 'fighting'
                                ? pokeColor = 0XFFC22E28
                                : types == 'poison'
                                    ? pokeColor = 0XFFA33EA1
                                    : types == 'ground'
                                        ? pokeColor = 0XFFE2BF65
                                        : types == 'flying'
                                            ? pokeColor = 0XFFA98FF3
                                            : types == 'psychic'
                                                ? pokeColor = 0XFFF95587
                                                : types == 'bug'
                                                    ? pokeColor = 0XFFA6B91A
                                                    : types == 'rock'
                                                        ? pokeColor = 0XFFB6A136
                                                        : types == 'ghost'
                                                            ? pokeColor =
                                                                0XFF735797
                                                            : types == 'dragon'
                                                                ? pokeColor =
                                                                    0XFF6F35FC
                                                                : types ==
                                                                        'dark'
                                                                    ? pokeColor =
                                                                        0XFF705746
                                                                    : types ==
                                                                            'steel'
                                                                        ? pokeColor =
                                                                            0XFFB7B7CE
                                                                        : pokeColor =
                                                                            0XFFD685AD;
    notifyListeners();
  }
}
