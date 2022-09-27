import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:pokedex/app/pokedex/screens/details/container/detail_container.dart';
import '../../../../common/models/pokemon.dart';
import 'type_pokemon.dart';

class ItemPokemon extends StatelessWidget {
  const ItemPokemon({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  });

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() =>
          onTap('/detail', DetailArguments(pokemon: pokemon, index: index))),
      child: Container(
        decoration: BoxDecoration(
            color: pokemon.baseColor!.withOpacity(1),
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    ('#${pokemon.num}'),
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        pokemon.type.map((e) => TypePokemon(type: e)).toList(),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: GifView.network(
                        pokemon.image,
                        progress: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
