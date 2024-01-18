import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_card/model/character_response/character_response.dart';
import 'package:pokemon_card/widget/pokemon_item.dart';

Future<CharacterResponse> fetchCharacter() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'));

  if (response.statusCode == 200) {
    return CharacterResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({super.key});

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  late Future<CharacterResponse> character;

  @override
  void initState() {
    super.initState();
    character = fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<CharacterResponse>(
        future: character,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PokemonItem(character: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
