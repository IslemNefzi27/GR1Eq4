import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculatrice simple'),
          backgroundColor: Colors.blue,
        ),
        body: const Calculatrice(),
      ),
    );
  }
}

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  String _resultat = '';

  @override
  void dispose() {
    _c1.dispose();
    _c2.dispose();
    super.dispose();
  }

  void _calculer(String op) {
    final double? a = double.tryParse(_c1.text.replaceAll(',', '.'));
    final double? b = double.tryParse(_c2.text.replaceAll(',', '.'));

    setState(() {
      if (a == null || b == null) {
        _resultat = 'Veuillez saisir deux nombres valides';
        return;
      }
      double r;
      switch (op) {
        case '+':
          r = a + b;
          break;
        case '-':
          r = a - b;
          break;
        case '×':
          r = a * b;
          break;
        case '÷':
          if (b == 0) {
            _resultat = 'Division par zéro impossible';
            return;
          }
          r = a / b;
          break;
        default:
          return;
      }
      final String txt =
          r == r.truncateToDouble() ? r.toInt().toString() : r.toString();
      _resultat = 'Résultat : $txt';
    });
  }

  void _reset() {
    setState(() {
      _c1.clear();
      _c2.clear();
      _resultat = '';
    });
  }

  Widget _boutonOp(String op) {
    return ElevatedButton(
      onPressed: () => _calculer(op),
      child: Text(op),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _c1,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(labelText: 'Nombre 1'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _c2,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(labelText: 'Nombre 2'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _boutonOp('+'),
                  _boutonOp('-'),
                  _boutonOp('×'),
                  _boutonOp('÷'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Reset'),
              ),
              const SizedBox(height: 24),
              Text(
                _resultat,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}