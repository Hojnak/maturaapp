// Plik: lib/main.dart

import 'package:flutter/material.dart';
import 'features/home/presentation/view/home_screen.dart'; // Import naszego ekranu głównego

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wyłączamy baner "Debug" w rogu ekranu
      debugShowCheckedModeBanner: false,
      title: 'Matura Helper',
      theme: ThemeData(
        // Użyjmy nowszego standardu Material 3 i ciemnego motywu
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      // Ustawiamy nasz ekran główny jako ekran startowy
      home: const HomeScreen(),
    );
  }
}