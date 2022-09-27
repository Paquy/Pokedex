import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

import '../../../../common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.dif, required this.pokemon});

  final Pokemon pokemon;
  final bool dif;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: dif ? 0.5 : 1.0,
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          tween: Tween<double>(end: dif ? 100 : 400, begin: dif ? 400 : 100),
          builder: ((context, value, child) {
            return GifView.network(
              pokemon.image,
              width: value,
              fit: BoxFit.contain,
              color: dif ? Colors.black.withOpacity(0.4) : null,
              progress: const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            );
          }),
        ),
      ),
    );
  }
}
