import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String message;

  const DetailsScreen({super.key, this.message = 'Aucun message reçu'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Retour à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}