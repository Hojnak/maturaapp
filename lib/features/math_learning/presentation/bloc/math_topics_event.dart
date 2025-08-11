part of 'math_topics_bloc.dart';

// POPRAWKA: Wracamy do "extends Equatable"
abstract class MathTopicsEvent extends Equatable {
  const MathTopicsEvent();

  @override
  List<Object> get props => [];
}

class LoadMathTopics extends MathTopicsEvent {}