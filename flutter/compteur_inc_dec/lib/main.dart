import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mon Compteur'),
          backgroundColor: Colors.deepPurple,
        ),
        body: const Compteur(),
      ),
    );
  }
}

class Compteur extends StatefulWidget {
  const Compteur({super.key});

  @override
  State<Compteur> createState() => _CompteurState();
}

class _CompteurState extends State<Compteur> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Valeur actuelle : $_count',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text('Décrémenter'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _increment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Incrémenter'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}