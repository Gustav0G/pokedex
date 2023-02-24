import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page/home_page.dart';
import 'package:pokedex/pages/pokemon_page/pokemon_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/pokemonPage': (context) => PokemonPage(),
      },
      home: const HomePage(),
    );
  }
}
