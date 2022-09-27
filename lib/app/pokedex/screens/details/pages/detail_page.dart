import 'package:flutter/material.dart';
import '../../../../common/models/pokemon.dart';
import '../widgets/detail_app_bar_widget.dart';
import '../widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.pokemon,
    required this.pokeList,
    required this.onBack,
    required this.controller,
    required this.changedPokemon,
  });

  final Pokemon pokemon;
  final List<Pokemon> pokeList;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> changedPokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
      onNotification: (notification) {
        setState(() {
          if (scrollController.position.pixels > 33) {
            isOnTop = false;
          } else if (scrollController.position.pixels <= 25) {
            isOnTop = true;
          }
        });
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          DetailAppBarWidget(
            pokemon: widget.pokemon,
            onBack: widget.onBack,
            isOnTop: isOnTop,
          ),
          DetailListWidget(
            pokemon: widget.pokemon,
            pokeList: widget.pokeList,
            controller: widget.controller,
            changedPokemon: widget.changedPokemon,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: widget.pokemon.baseColor,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
