import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: Scaffold(body: Home())));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String pokemonName = "Cargando...";
  String pokemonImg = "";

  @override
  void initState() {
    super.initState();
    fetchDitto(); 
  }

  Future<void> fetchDitto() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          pokemonName = data['name'].toString().toUpperCase();
          pokemonImg = data['sprites']['front_default'];
        });
      }
    } catch (e) {
      setState(() => pokemonName = "Error al cargar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(10),
            child: const Text('LDSW 3.4. Utilización de widgets'),
          ),

          const SizedBox(height: 20),

          pokemonImg.isNotEmpty
              ? Image.network(pokemonImg, width: 120, height: 120)
              : const CircularProgressIndicator(),

          Text(
            pokemonName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check),
              Text(' Widget Row'),
            ],
          ),
          
          const SizedBox(height: 10),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 150, height: 50, color: Colors.amber),
              const Text('Texto en Stack'),
            ],
          ),
        ],
      ),
    );
  }
}