// Plik: lib/features/math_learning/presentation/view/learning_mode_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matura_app_final/features/math_learning/presentation/bloc/math_topics_bloc.dart';
import 'package:matura_app_final/features/topic_details/presentation/view/topic_details_screen.dart';

class LearningModeScreen extends StatelessWidget {
  const LearningModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matematyka - Działy'),
      ),
      // BlocProvider tworzy i dostarcza BLoC-a do drzewa widgetów poniżej
      body: BlocProvider(
        create: (context) => MathTopicsBloc()..add(LoadMathTopics()),
        // BlocBuilder nasłuchuje na zmiany stanu i przebudowuje UI
        child: BlocBuilder<MathTopicsBloc, MathTopicsState>(
          builder: (context, state) {
            // W zależności od stanu, pokazujemy inny widget
            if (state is MathTopicsLoading || state is MathTopicsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MathTopicsLoaded) {
              return ListView.builder(
                itemCount: state.topics.length,
                itemBuilder: (context, index) {
                  final topic = state.topics[index];
                  return ListTile(
                    leading: const Icon(Icons.folder_outlined),
                    title: Text(topic),
                    onTap: () {
                      // POPRAWKA: Nawigujemy do nowego ekranu, przekazując nazwę działu
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TopicDetailsScreen(topicName: topic),
                        ),
                      );
                    },
                  );
                },
              );
            }
            if (state is MathTopicsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            // Domyślny stan, jeśli żaden z powyższych nie pasuje
            return const Center(child: Text('Nieznany stan'));
          },
        ),
      ),
    );
  }
}