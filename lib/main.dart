import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/appwidget.dart';
import 'package:pokedex/controller/pokemon_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PokemonController>(
          create: (_) => PokemonController(PokemonRepository(Dio())))
    ],
    child: const AppWidget(),
  ));
}
