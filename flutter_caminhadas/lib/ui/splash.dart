import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  final Function(bool) onTemaChange;

  const SplashScreen({super.key, required this.onTemaChange});

  @override
  Widget build(BuildContext context) {
    bool temaEscuro = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_walk, size: 100, color: Colors.pink),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tema escuro'),
                Switch(value: temaEscuro, onChanged: onTemaChange),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
