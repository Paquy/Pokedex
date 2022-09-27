import 'package:flutter/material.dart';
import 'package:pokedex/app/common/errors/error.dart';
import 'package:pokedex/app/common/models/pokemon.dart';
import 'package:pokedex/app/common/repositories/pokemon_repository.dart';
import 'package:pokedex/app/common/widget/poke_loading.dart';
import '../../details/container/detail_container.dart';
import '../pages/home_error.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.repository,
    required this.onItemTap,
  });
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PokeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            pokeList: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Error).message!,
          );
        }

        return Container();
      }),
    );
  }
}
