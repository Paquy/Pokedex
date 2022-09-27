import 'package:flutter/material.dart';
import 'package:pokedex/app/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/app/pokedex/screens/home/container/home_container.dart';
import 'package:pokedex/app/common/repositories/pokemon_repository.dart';

class PokemonRoute extends StatelessWidget {
  const PokemonRoute({super.key, required this.repository});

  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: ((settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }
        if (settings.name == '/detail') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repository: repository,
              arguments: (settings.arguments as DetailArguments),
              onBack: () => Navigator.of(context).pop(),
            );
          });
        }
        return null;
      }),
    );
  }
}
