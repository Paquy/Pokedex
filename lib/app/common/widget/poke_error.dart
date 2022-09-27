import 'package:flutter/material.dart';

class PokeError extends StatelessWidget {
  const PokeError({super.key, this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro ao carregar!'),
      ),
    );
  }
}
