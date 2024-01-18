import 'package:flutter/material.dart';
import 'package:pokemon_card/model/character_response/character_response.dart';
import 'package:flip_card/flip_card.dart';

class PokemonItem extends StatelessWidget {
  final CharacterResponse character;
  const PokemonItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    int? weight = character.weight;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              side: CardSide.FRONT,
              front: SizedBox(
                height: 150,
                width: 250,
                child: Card(
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(character.sprites!.frontDefault!),
                        Text(
                          character.name!.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              back: SizedBox(
                height: 150,
                width: 250,
                child: Card(
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            character.name!.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight lb',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
