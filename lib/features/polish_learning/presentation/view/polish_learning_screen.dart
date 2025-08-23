import 'package:flutter/material.dart';
import 'package:matura_app_final/features/polish_learning/presentation/view/essay_topics_screen.dart';

class PolishLearningScreen extends StatelessWidget {
  const PolishLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Język Polski - Nauka'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          children: [
            _buildLearningTile(
              context,
              'Wypracowania',
              Icons.edit_note,
              Colors.blue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EssayTopicsScreen(),
                  ),
                );
              },
            ),
            _buildLearningTile(
              context,
              'Lektury',
              Icons.menu_book,
              Colors.green,
              () {
                // Navigate to literature screen
              },
            ),
            _buildLearningTile(
              context,
              'Notatka syntetyzująca',
              Icons.summarize,
              Colors.orange,
              () {
                // Navigate to synthetic note screen
              },
            ),
            _buildLearningTile(
              context,
              'Nauka pisania',
              Icons.school,
              Colors.purple,
              () {
                // Navigate to writing learning screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
