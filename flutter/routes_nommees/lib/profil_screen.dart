import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  final String nom;
  final String niveau;

  const ProfilScreen({super.key, required this.nom, required this.niveau});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nom : $nom', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 6),
            Text("Niveau d'étude : $niveau",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: "Bienvenue sur l'écran Détails, $nom !",
                );
              },
              child: const Text('Voir les détails'),
            ),
          ],
        ),
      ),
    );
  }
}