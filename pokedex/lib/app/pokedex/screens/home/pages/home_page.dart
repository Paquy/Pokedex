import 'package:flutter/material.dart';
import 'package:pokedex/app/common/models/pokemon.dart';
import 'package:pokedex/app/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/app/pokedex/screens/home/widgets/item_pokemo.dart';

import '../widgets/search_pokemon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.pokeList,
    required this.onItemTap,
  });

  final List<Pokemon> pokeList;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.brightness_4_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SearchPokemonWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: pokeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) => ItemPokemon(
                  pokemon: pokeList[index],
                  onTap: onItemTap,
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
