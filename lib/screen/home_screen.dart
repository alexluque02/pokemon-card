import 'package:flutter/material.dart';
import 'package:pokemon_card/widget/pokemon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke api'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 170, 170, 170),
        child: const Column(
          children: [PokemonWidget()],
        ),
      ),
    );
  }
}
