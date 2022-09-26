import 'package:flutter/material.dart';
import 'package:pokedex/app/pokedex/screens/details/widgets/detail_item_list_widget.dart';

import '../../../../common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    super.key,
    required this.pokemon,
    required this.pokeList,
    required this.controller,
    required this.changedPokemon,
  });

  final Pokemon pokemon;
  final List<Pokemon> pokeList;
  final PageController controller;
  final ValueChanged<Pokemon> changedPokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  changedPokemon(pokeList[index]);
                },
                controller: controller,
                children: pokeList.map(
                  (e) {
                    bool dif = e.name != pokemon.name;
                    return DetailItemListWidget(
                      dif: dif,
                      pokemon: e,
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
