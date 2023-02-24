import 'package:flutter/material.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import '../model/pokemon_details_model.dart';
import '../model/pokemon_model.dart';

class PokemonController extends ChangeNotifier {
  PokemonRepository pokemonRepository;

  List<PokemonModel> _pokemonsList = [];
  final List<PokemonDetailsModel> _pokemonDetailsList = [];

  PokemonController(this.pokemonRepository);

  void getPokemonList() async {
    _pokemonsList = await pokemonRepository.getPokemons();
    _getPokemonDetailsList();
  }

  void _getPokemonDetailsList() async {
    _pokemonsList.forEach((element) async {
      _pokemonDetailsList
          .add(await pokemonRepository.getPokemonDetails(element.url));
      print(_pokemonDetailsList.length);
      notifyListeners();
    });
    //print(_pokemonDetailsList);
  }

  List<PokemonModel> get pokemons => _pokemonsList;
  List<PokemonDetailsModel> get details => _pokemonDetailsList;

  Color pokemonColor(String type) {
    Color pokeColor = Colors.white;
    switch (type) {
      case 'fire':
        {
          pokeColor = const Color(0xffEE8130);
        }
        break;
      case 'water':
        {
          pokeColor = const Color(0xff6390F0);
        }
        break;
      case 'normal':
        {
          pokeColor = const Color(0xffA8A77A);
        }
        break;
      case 'electric':
        {
          pokeColor = const Color(0xffF7D02C);
        }
        break;
      case 'grass':
        {
          pokeColor = const Color(0xff7AC74C);
        }
        break;
      case 'ice':
        {
          pokeColor = const Color(0xff96D9D6);
        }
        break;
      case 'fighting':
        {
          pokeColor = const Color(0xffC22E28);
        }
        break;
      case 'poison':
        {
          pokeColor = const Color(0xffA33EA1);
        }
        break;
      case 'ground':
        {
          pokeColor = const Color(0xffE2BF65);
        }
        break;
      case 'flying':
        {
          pokeColor = const Color(0xffA98FF3);
        }
        break;
      case 'psychic':
        {
          pokeColor = const Color(0xffF95587);
        }
        break;
      case 'bug':
        {
          pokeColor = const Color(0xffA6B91A);
        }
        break;
      case 'rock':
        {
          pokeColor = const Color(0xffB6A136);
        }
        break;
      case 'ghost':
        {
          pokeColor = const Color(0xff735797);
        }
        break;
      case 'dragon':
        {
          pokeColor = const Color(0xff6F35FC);
        }
        break;
      case 'dark':
        {
          pokeColor = const Color(0xffE2BF65);
        }
        break;
      case 'steel':
        {
          pokeColor = const Color(0xff705746);
        }
        break;
      case 'fairy':
        {
          pokeColor = const Color(0xffD685AD);
        }
    }
    return pokeColor;
  }
}
