// Plik: lib/features/topic_details/presentation/view/topic_details_screen.dart

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Krok 1: Zmieniamy na StatefulWidget
class TopicDetailsScreen extends StatefulWidget {
  // Dodajemy pole na nazwę działu, którą otrzymamy z poprzedniego ekranu
  final String topicName;

  const TopicDetailsScreen({super.key, required this.topicName});

  @override
  State<TopicDetailsScreen> createState() => _TopicDetailsScreenState();
}

class _TopicDetailsScreenState extends State<TopicDetailsScreen> {
  // Krok 2: Tworzymy kontroler dla odtwarzacza wideo
  late VideoPlayerController _controller;

  // Krok 3: Inicjalizujemy kontroler, gdy widget jest tworzony
  @override
  void initState() {
    super.initState();
    // Używamy przykładowego wideo z internetu. W przyszłości ten link
    // będzie pochodził z Twojej bazy danych Firebase.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    )..initialize().then((_) {
        // Upewniamy się, że UI się odświeży po załadowaniu wideo
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Używamy nazwy działu przekazanej do widgetu
        title: Text(widget.topicName),
      ),
      body: Center(
        // Krok 4: Sprawdzamy, czy wideo jest gotowe do odtworzenia
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            // Jeśli nie, pokazujemy kółko ładowania
            : const CircularProgressIndicator(),
      ),
      // Krok 5: Dodajemy przycisk do włączania/pauzowania wideo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  // Krok 6: Sprzątamy po sobie, gdy widget jest usuwany z ekranu
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}