import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();
  final _telController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _telController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _envoyer() {
    if (_formKey.currentState!.validate()) {
      final contact = ContactModel(
        nom: _nomController.text.trim(),
        email: _emailController.text.trim(),
        telephone: _telController.text.trim(),
        message: _messageController.text.trim(),
      );
      Navigator.pushNamed(context, '/confirmation', arguments: contact);
    }
  }

  // Style commun des champs (bordure arrondie + icône)
  InputDecoration _decoration(String label, IconData icone) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icone),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: _decoration('Nom', Icons.person),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le nom est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _decoration('Email', Icons.email),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "L'email est requis";
                  } else if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value.trim())) {
                    return "L'email n'est pas valide";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _telController,
                keyboardType: TextInputType.phone,
                decoration: _decoration('Téléphone', Icons.phone),
                // Champ facultatif : on vérifie seulement s'il est rempli
                validator: (value) {
                  if (value != null &&
                      value.trim().isNotEmpty &&
                      !RegExp(r'^[0-9+ ]{8,15}$').hasMatch(value.trim())) {
                    return 'Numéro de téléphone invalide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                decoration: _decoration('Message', Icons.message),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Message requis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _envoyer,
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}