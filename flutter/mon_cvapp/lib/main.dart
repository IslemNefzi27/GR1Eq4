import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens.dart';

void main() => runApp(const MonCvApp());

class MonCvApp extends StatelessWidget {
  const MonCvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon_CVAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF1F8F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            minimumSize: const Size(220, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      initialRoute: Routes.accueil,
      routes: {
        Routes.accueil: (context) => const AccueilScreen(),
        Routes.formation: (context) => const FormationScreen(),
        Routes.experience: (context) => const ExperienceScreen(),
        Routes.competences: (context) => const CompetencesScreen(),
        Routes.contact: (context) => const ContactScreen(),
      },
    );
  }
}