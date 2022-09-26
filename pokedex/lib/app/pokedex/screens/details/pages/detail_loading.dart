import 'package:flutter/material.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
