import 'package:flutter/material.dart';

import 'accueil_screen.dart';
import 'details_screen.dart';
import 'profil_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation avec données',
      initialRoute: '/',
      routes: {
        '/': (context) => const AccueilScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/profil':
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => ProfilScreen(
                nom: args['nom']!,
                niveau: args['niveau']!,
              ),
            );
          case '/details':
            final message = settings.arguments as String;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsScreen(message: message),
            );
        }
        return null;
      },
    );
  }
}