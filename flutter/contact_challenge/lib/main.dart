import 'package:flutter/material.dart';

import 'models/contact_model.dart';
import 'screens/confirmation_page.dart';
import 'screens/contact_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactForm(),
      },
      
      onGenerateRoute: (settings) {
        if (settings.name == '/confirmation') {
          final contact = settings.arguments as ContactModel;
          return MaterialPageRoute(
            builder: (context) => ConfirmationPage(contact: contact),
          );
        }
        return null;
      },
    );
  }
}