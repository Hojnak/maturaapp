// Plik: lib/features/home/presentation/view/home_screen.dart

import 'package:flutter/material.dart';
// Upewnij się, że ta ścieżka jest poprawna dla Twojego projektu!
// Zmień 'flutter_application_1' na nazwę swojego projektu, jeśli jest inna.
import 'package:matura_app_final/features/subject_details/presentation/view/subject_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold to główna struktura ekranu
    return Scaffold(
      // Drawer to wysuwany panel boczny
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Subskrypcja'),
              onTap: () {
                // Tutaj będzie logika przejścia do ekranu subskrypcji
                Navigator.pop(context); // Zamyka panel boczny
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ustawienia'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // AppBar to górny pasek aplikacji
      appBar: AppBar(
        // Usuwamy tło, aby zintegrować pasek z resztą ekranu
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Ikona profilu po prawej stronie
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, size: 30),
            onPressed: () {
              // Tutaj będzie logika logowania/profilu
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Body to główna zawartość ekranu
      // Używamy ListView, aby zapewnić przewijanie na mniejszych ekranach
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          // Sekcja wyboru przedmiotów
          _buildSubjectSelection(context),
          const SizedBox(height: 40),

          // Sekcja "Aktualności"
          const Text(
            'Aktualności',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildNewsCard(),
          const SizedBox(height: 40),

          // Przycisk "Codzienne Wyzwanie"
          _buildDailyChallengeButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Prywatna metoda budująca sekcję wyboru przedmiotów
  Widget _buildSubjectSelection(BuildContext context) {
    return Row(
      children: [
        // Używamy Expanded, aby każdy przycisk zajął połowę szerokości
        Expanded(
          child: _SubjectCard(
            subjectName: 'Matematyka',
            icon: Icons.calculate_outlined,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SubjectDetailsScreen(subjectName: 'Matematyka'),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _SubjectCard(
            subjectName: 'Język Polski',
            icon: Icons.book_outlined,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SubjectDetailsScreen(subjectName: 'Język Polski'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Prywatna metoda budująca kartę aktualności
  Widget _buildNewsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Egzaminy zbliżają się – jak efektywnie powtórzyć materiał?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Odkryj sprawdzone metody i techniki, które pomogą Ci zdać maturę na 100%.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // Prywatna metoda budująca przycisk wyzwania
  Widget _buildDailyChallengeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Codzienne Wyzwanie',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

// Prywatny, reużywalny widget dla karty przedmiotu
class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    required this.subjectName,
    required this.icon,
    required this.onTap,
  });

  final String subjectName;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            Text(
              subjectName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}