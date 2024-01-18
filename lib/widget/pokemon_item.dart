import 'package:flutter/material.dart';
import 'package:pokemon_card/model/character_list_response/character_list_response/result.dart';
import 'package:flip_card/flip_card.dart';

class PokemonItem extends StatelessWidget {
  final Result character;
  const PokemonItem({super.key, required this.character});

  urlImagen() {
    List<String> urlArray = character.url!.split('');
    String reversedArray = urlArray.reversed.join();
    String id = reversedArray.split('')[1];
    return id;
  }

  @override
  Widget build(BuildContext context) {
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
                        Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            '${'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' + urlImagen()}.png'),
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
                          const Text(
                            'Yo soy un pokemon',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
