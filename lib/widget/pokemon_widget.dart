import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_card/model/character_list_response/character_list_response/character_list_response.dart';
import 'package:pokemon_card/screen/home_screen.dart';

Future<CharacterListResponse> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

  if (response.statusCode == 200) {
    return CharacterListResponse.fromJson(response.body);
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
  late Future<CharacterListResponse> pokemonList;

  @override
  void initState() {
    super.initState();
    pokemonList = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<CharacterListResponse>(
        future: pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(pokemonList: snapshot.data!.results!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
