import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/common/routes/route.dart';
import 'package:pokedex/app/common/repositories/pokemon_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex API',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokemonRoute(
          repository: PokemonRepository(dio: Dio()),
        ));
  }
}
