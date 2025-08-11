import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_topics_event.dart';
part 'math_topics_state.dart';

class MathTopicsBloc extends Bloc<MathTopicsEvent, MathTopicsState> {
  MathTopicsBloc() : super(MathTopicsInitial()) {
    on<LoadMathTopics>(_onLoadMathTopics);
  }

  Future<void> _onLoadMathTopics(
    LoadMathTopics event,
    Emitter<MathTopicsState> emit,
  ) async {
    emit(MathTopicsLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      final topics = [
        'Funkcje',
        'Ciągi',
        'Geometria analityczna',
        'Planimetria',
        'Stereometria',
        'Trygonometria',
        'Liczby rzeczywiste',
        'Wyrażenia algebraiczne',
        'Równania i nierówności',
        'Kombinatoryka',
        'Rachunek prawdopodobieństwa',
        'Statystyka',
      ];

      emit(MathTopicsLoaded(topics));
    } catch (e) {
      emit(MathTopicsError('Wystąpił błąd podczas ładowania działów.'));
    }
  }
}