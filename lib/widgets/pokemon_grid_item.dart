import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/pokemon_controller.dart';

class PokemonGridItem extends StatelessWidget {
  final int index;

  const PokemonGridItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/pokemonPage', arguments: index);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Provider.of<PokemonController>(context).pokemonColor(
                Provider.of<PokemonController>(context)
                    .details[index]
                    .types![0]
                    .type!
                    .name!,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Provider.of<PokemonController>(context)
                        .details[index]
                        .name!
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //TextTypePokemon(index: index)
                  Chip(
                    label: Text(Provider.of<PokemonController>(context)
                        .details[index]
                        .types![0]
                        .type!
                        .name!
                        .toString()),
                    backgroundColor:
                        Provider.of<PokemonController>(context).pokemonColor(
                      Provider.of<PokemonController>(context)
                          .details[index]
                          .types![0]
                          .type!
                          .name!,
                    ),
                    elevation: 6,
                  )
                ],
              ),
              Positioned(
                left: 95,
                top: 25,
                child: Image.network(
                  Provider.of<PokemonController>(context)
                      .details[index]
                      .sprites!
                      .frontDefault!,
                ),
              ),
            ],
          )),
    );
  }
}
