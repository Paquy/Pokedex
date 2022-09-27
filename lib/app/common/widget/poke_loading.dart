import 'package:flutter/material.dart';

class PokeLoading extends StatelessWidget {
  const PokeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
