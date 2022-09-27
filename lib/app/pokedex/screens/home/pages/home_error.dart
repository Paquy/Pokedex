import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
