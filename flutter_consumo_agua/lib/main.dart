import 'package:flutter/material.dart';
import 'ui/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bebi Água',

      theme: darkTheme
          ? ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF121212),
              cardColor: const Color(0xFF1E1E1E),

              primaryColor: const Color(0xFF1565C0),

              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
                titleLarge: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                hintStyle: TextStyle(color: Colors.white54),
                labelStyle: TextStyle(color: Colors.white),

                // AZUL ESCURO
                floatingLabelStyle: TextStyle(color: Color(0xFF1565C0)),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1565C0)),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),

              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Color(0xFF1565C0),
                selectionColor: Color(0xFF1565C0),
                selectionHandleColor: Color(0xFF1565C0),
              ),
            )
          : ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.white,

              // AZUL ESCURO
              primaryColor: const Color(0xFF1565C0),

              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
                titleLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black45),
                labelStyle: TextStyle(color: Colors.black),

                // AZUL ESCURO
                floatingLabelStyle: TextStyle(color: Color(0xFF1565C0)),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1565C0)),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),

              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Color(0xFF1565C0),
                selectionColor: Color(0xFF1565C0),
                selectionHandleColor: Color(0xFF1565C0),
              ),
            ),

      home: SplashScreen(
        onThemeChange: (value) {
          setState(() {
            darkTheme = value;
          });
        },
      ),
    );
  }
}
