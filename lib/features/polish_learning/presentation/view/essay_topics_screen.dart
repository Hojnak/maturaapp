import 'package:flutter/material.dart';
import 'package:matura_app_final/features/polish_learning/presentation/view/essay_editor_screen.dart';

class EssayTopicsScreen extends StatelessWidget {
  const EssayTopicsScreen({super.key});

  // Przykładowe tematy z poprzednich matur
  final List<Map<String, String>> essayTopics = const [
    {
      'year': '2023',
      'topic': 'Czy warto bronić własnych przekonań? Rozważ problem i uzasadnij swoje stanowisko, odwołując się do fragmentu "Dziadów" cz. III Adama Mickiewicza oraz do wybranych tekstów kultury.',
      'type': 'Wypracowanie'
    },
    {
      'year': '2022', 
      'topic': 'Jaką rolę w życiu człowieka odgrywają marzenia? Rozważ problem i uzasadnij swoje stanowisko, odwołując się do podanego fragmentu "Lalki" Bolesława Prusa oraz do wybranych tekstów kultury.',
      'type': 'Wypracowanie'
    },
    {
      'year': '2021',
      'topic': 'Czym dla człowieka może być wolność? Rozważ problem i uzasadnij swoje stanowisko, odwołując się do podanego fragmentu "Dziadów" cz. III Adama Mickiewicza oraz do wybranych tekstów kultury.',
      'type': 'Wypracowanie'
    },
    {
      'year': '2020',
      'topic': 'Jaką funkcję pełni przyroda w "Panu Tadeuszu" Adama Mickiewicza? Omów na podstawie podanego fragmentu i całości utworu.',
      'type': 'Wypracowanie'
    },
    {
      'year': '2019',
      'topic': 'Czy warto kochać, jeśli miłość może być źródłem cierpienia? Rozważ problem i uzasadnij swoje stanowisko, odwołując się do fragmentu "IV części Dziadów" Adama Mickiewicza oraz do wybranych tekstów kultury.',
      'type': 'Wypracowanie'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tematy wypracowań'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: essayTopics.length,
        itemBuilder: (context, index) {
          final topic = essayTopics[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    topic['year']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Matura ${topic['year']} - ${topic['type']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                topic['topic']!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to essay editor with selected topic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EssayEditorScreen(
                      topic: topic['topic']!,
                      year: topic['year']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
