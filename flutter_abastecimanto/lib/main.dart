import 'package:flutter/material.dart';
import 'style/theme.dart';
import 'ui/splash.dart';

void main() {
  runApp(const AbastecimentosApp());
}

class AbastecimentosApp extends StatefulWidget {
  const AbastecimentosApp({super.key});

  @override
  State<AbastecimentosApp> createState() => _AbastecimentosAppState();
}

class _AbastecimentosAppState extends State<AbastecimentosApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Histórico de Abastecimentos',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(
        onThemeChange: (value) {
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}
