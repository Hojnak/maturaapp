import 'package:flutter/material.dart';

class EssayEditorScreen extends StatelessWidget {
  final String topic;
  final String year;

  const EssayEditorScreen({
    super.key,
    required this.topic,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matura $year - $topic'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Temat: $topic',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Napisz swoje wypracowanie tutaj...',
                  fillColor: Colors.grey.withOpacity(0.15),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement AI feedback and evaluation
              },
              child: const Text('Sprawdź wypracowanie'),
            ),
          ],
        ),
      ),
    );
  }
}
