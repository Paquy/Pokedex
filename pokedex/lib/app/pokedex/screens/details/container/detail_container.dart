import 'package:flutter/material.dart';
import 'package:pokedex/app/common/widget/poke_error.dart';
import 'package:pokedex/app/common/widget/poke_loading.dart';
import 'package:pokedex/app/pokedex/screens/details/pages/detail_page.dart';
import '../../../../common/models/pokemon.dart';
import '../../../../common/repositories/pokemon_repository.dart';

class DetailArguments {
  final Pokemon pokemon;
  final int? index;
  DetailArguments({this.index = 0, required this.pokemon});
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    super.key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  });

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;
  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.4,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PokeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _pokemon ??= widget.arguments.pokemon;
          return DetailPage(
            pokemon: _pokemon!,
            pokeList: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            changedPokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }

        if (snapshot.hasError) {
          return PokeError(
            error: snapshot.error.toString(),
          );
        }

        return Container();
      }),
    );
  }
}
