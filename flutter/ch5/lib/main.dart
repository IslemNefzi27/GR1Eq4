import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation simple',
      home: FirstScreen(),
    );
  }
}

final ButtonStyle boutonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  textStyle: const TextStyle(fontSize: 16),
);

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(title: const Text('Écran 1')),
      body: Center(
        child: ElevatedButton(
          style: boutonStyle,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SecondScreen(message: 'Bienvenue dans le 2ème écran'),
              ),
            );
          },
          child: const Text("Aller à l'écran 2"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String message;

  const SecondScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(title: const Text('Écran 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            ElevatedButton(
              style: boutonStyle,
              onPressed: () => Navigator.pop(context),
              child: const Text("Retour à l'écran 1"),
            ),
          ],
        ),
      ),
    );
  }
}