import 'package:flutter/material.dart';

class DetailError extends StatelessWidget {
  const DetailError({super.key, required this.error});

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
