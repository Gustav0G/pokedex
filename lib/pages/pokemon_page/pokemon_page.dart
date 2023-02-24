import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokemon_controller.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatefulWidget {
  int? index;

  PokemonPage({Key? key, this.index}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    widget.index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<PokemonController>(context).pokemonColor(
          Provider.of<PokemonController>(context)
              .details[widget.index!]
              .types![0]
              .type!
              .name!,
        ),
        elevation: 0,
        title: const Text('Pokedex'),
        actions: [
          Column(
            children: [
              Text(
                Provider.of<PokemonController>(context)
                    .details[widget.index!]
                    .id
                    .toString(),
              )
            ],
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: Provider.of<PokemonController>(context).pokemonColor(
                    Provider.of<PokemonController>(context)
                        .details[widget.index!]
                        .types![0]
                        .type!
                        .name!,
                  ),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Container(
                decoration: const BoxDecoration(),
                child: Image.network(
                  Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .sprites!
                      .frontDefault
                      .toString(),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .name
                      .toString()
                      .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Chip(
                      label: Text(Provider.of<PokemonController>(context)
                          .details[widget.index!]
                          .types![0]
                          .type!
                          .name!
                          .toString()),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      labelStyle: const TextStyle(color: Colors.white),
                      backgroundColor:
                          Provider.of<PokemonController>(context).pokemonColor(
                        Provider.of<PokemonController>(context)
                            .details[widget.index!]
                            .types![0]
                            .type!
                            .name!,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ('${(Provider.of<PokemonController>(context).details[widget.index!].weight! * 0.1).toStringAsFixed(1)} kg'),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ('${(Provider.of<PokemonController>(context).details[widget.index!].height! * 0.1).toStringAsFixed(1)} m'),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Base Stats',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                PokemonStats(
                  statName: 'Hp',
                  statColor: Colors.red,
                  statValue: Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .stats![0]
                      .baseStat,
                ),
                PokemonStats(
                  statName: 'atk',
                  statColor: Colors.amber,
                  statValue: Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .stats![1]
                      .baseStat,
                ),
                PokemonStats(
                  statName: 'def',
                  statColor: Colors.blue,
                  statValue: Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .stats![2]
                      .baseStat,
                ),
                PokemonStats(
                  statName: 'SPD',
                  statColor: Colors.blueAccent,
                  statValue: Provider.of<PokemonController>(context)
                      .details[widget.index!]
                      .stats![5]
                      .baseStat,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
