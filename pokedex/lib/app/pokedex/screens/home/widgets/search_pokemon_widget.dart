import 'package:flutter/material.dart';
import 'package:pokedex/app/pokedex/screens/home/controller/home_controller.dart';

// ignore: must_be_immutable
class SearchPokemonWidget extends StatelessWidget {
  SearchPokemonWidget({super.key});

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
      child: TextFormField(
        onChanged: controller.onChanged,
        cursorColor: Colors.red,
        maxLength: 30,
        maxLines: 1,
        decoration: const InputDecoration(
          icon: ImageIcon(
            AssetImage('assets/images/pokebola.png'),
            color: Colors.red,
            size: 50,
          ),
          labelText: 'Pokemon',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
