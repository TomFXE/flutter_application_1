import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Home())));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container( 
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(10),
            child: const Text('LDSW 3.4. Utilización de widgets'), // 3. Text
          ),
          const Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.check), Text(' Widget Row')],
          ), 
          Stack( 
            alignment: Alignment.center,
            children: [
              Container(width: 100, height: 50, color: Colors.amber),
              const Text('Texto en Stack'),
            ],
          ),
        ],
      ),
    );
  }
}