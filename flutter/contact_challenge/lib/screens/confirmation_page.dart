import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ConfirmationPage extends StatelessWidget {
  final ContactModel contact;

  const ConfirmationPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎉 Merci pour votre message !',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text('Nom : ${contact.nom}'),
            Text('Email : ${contact.email}'),
            Text('Téléphone : ${contact.telephone}'),
            const SizedBox(height: 12),
            const Text('Message :',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(contact.message),
          ],
        ),
      ),
    );
  }
}