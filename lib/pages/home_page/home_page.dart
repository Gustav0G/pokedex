import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokemon_controller.dart';
import 'package:pokedex/widgets/pokemon_grid_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<PokemonController>(context, listen: false).getPokemonList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              height: 150,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pokedex',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  //PokemonChips()
                ],
              ),
            )),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
              ),
              itemCount: Provider.of<PokemonController>(context).details.length,
              itemBuilder: (BuildContext context, index) {
                return PokemonGridItem(index: index);
              }),
        ));
  }
}
