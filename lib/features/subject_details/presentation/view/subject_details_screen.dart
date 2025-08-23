// Plik: lib/features/subject_details/presentation/view/subject_details_screen.dart

import 'package:flutter/material.dart';
import 'package:matura_app_final/features/math_learning/presentation/view/learning_mode_screen.dart';
import 'package:matura_app_final/features/polish_learning/presentation/view/polish_learning_screen.dart';


class SubjectDetailsScreen extends StatelessWidget {
  // Ten ekran wymaga podania nazwy przedmiotu przy tworzeniu
  const SubjectDetailsScreen({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Używamy przekazanej nazwy przedmiotu w tytule
        title: Text(subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
                textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (subjectName == 'Język Polski') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PolishLearningScreen(),
                    ),
                  );
                } else if (subjectName == 'Matematyka') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LearningModeScreen(),
                    ),
                  );
                }
              },

              child: const Text('Nauka'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
                textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // Na razie nic nie robi
              },
              child: const Text('Przygotowanie do Matury'),
            ),
          ],
        ),
      ),
    );
  }
}
