import 'package:flutter/material.dart';

import 'routes.dart';

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  Widget _navButton(
      BuildContext context, String label, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon CV')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.teal.shade100,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profil.jpg',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Prénom NOM',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Étudiant en E-Business',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            const Text(
              'Passionné par le développement mobile et le numérique. '
              'À la recherche d\'un stage pour mettre en pratique mes compétences.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _navButton(context, 'Formation', Icons.school, Routes.formation),
            _navButton(context, 'Expérience', Icons.work, Routes.experience),
            _navButton(context, 'Compétences', Icons.build, Routes.competences),
            _navButton(context, 'Contact', Icons.mail, Routes.contact),
          ],
        ),
      ),
    );
  }
}

class _Item {
  final String titre;
  final String sousTitre;
  final String periode;

  const _Item(this.titre, this.sousTitre, this.periode);
}

class _ListeScreen extends StatelessWidget {
  final String titre;
  final IconData icone;
  final List<_Item> items;

  const _ListeScreen(
      {required this.titre, required this.icone, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titre)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(icone, color: Colors.teal),
              title: Text(item.titre,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${item.sousTitre}\n${item.periode}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

class FormationScreen extends StatelessWidget {
  const FormationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ListeScreen(
      titre: 'Formation',
      icone: Icons.school,
      items: [
        _Item('Licence en E-Business', 'ESSECT', '2023 - 2026'),
        _Item('Baccalauréat', 'Lycée ...', '2022 - 2023'),
      ],
    );
  }
}

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ListeScreen(
      titre: 'Expérience',
      icone: Icons.work,
      items: [
        _Item('Stage de développement', 'Entreprise ...', 'Été 2025'),
        _Item('Projet académique Flutter', 'Module Développement Mobile',
            '2026'),
      ],
    );
  }
}

class CompetencesScreen extends StatelessWidget {
  const CompetencesScreen({super.key});

  static const _competences = [
    'Flutter',
    'Dart',
    'UML',
    'SQL',
    'Git / GitHub',
    'Gestion de projet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compétences')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _competences
              .map((c) => Chip(
                    label: Text(c),
                    backgroundColor: Colors.teal.shade100,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.mail, color: Colors.teal),
              title: Text('prenom.nom@email.com'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('+216 XX XXX XXX'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.teal),
              title: Text('Tunis, Tunisie'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.popUntil(
                  context, ModalRoute.withName(Routes.accueil)),
              child: const Text("Retour à l'accueil"),
            ),
          ),
        ],
      ),
    );
  }
}