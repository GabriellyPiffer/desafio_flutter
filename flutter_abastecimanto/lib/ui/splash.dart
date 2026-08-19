import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatelessWidget {
  final Function(bool) onThemeChange;

  const SplashScreen({super.key, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_gas_station, size: 80, color: Colors.pink),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tema escuro'),

                Switch(
                  value: isDark,
                  onChanged: (v) {
                    onThemeChange(v);
                  },
                ),
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
