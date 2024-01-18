import 'package:flutter/material.dart';
import 'package:pokemon_card/model/character_list_response/character_list_response/result.dart';
import 'package:pokemon_card/widget/pokemon_item.dart';
//import 'package:pokemon_card/widget/pokemon_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  final List<Result> pokemonList;
  const HomeScreen({super.key, required this.pokemonList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    // Aquí puedes realizar la lógica para cargar la petición y luego cambiar el estado de _enabled.
    // Por ejemplo, podrías realizar una llamada a una función asincrónica para cargar datos.
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulación de carga de datos.
    await Future.delayed(Duration(seconds: 2));

    // Después de cargar los datos, cambia el estado de _enabled.
    setState(() {
      _enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: Skeletonizer(
          enabled: _enabled,
          child: ListView.builder(
            itemCount: widget.pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonItem(character: widget.pokemonList[index]);
            },
          ),
        ));
  }

  // function to display fetched data on scre
}
