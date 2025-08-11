part of 'math_topics_bloc.dart';

// POPRAWKA: Wracamy do "extends Equatable"
abstract class MathTopicsState extends Equatable {
  const MathTopicsState();

  @override
  List<Object> get props => [];
}

class MathTopicsInitial extends MathTopicsState {}

class MathTopicsLoading extends MathTopicsState {}

class MathTopicsLoaded extends MathTopicsState {
  final List<String> topics;

  const MathTopicsLoaded(this.topics);

  @override
  List<Object> get props => [topics];
}

class MathTopicsError extends MathTopicsState {
  final String message;

  const MathTopicsError(this.message);

  @override
  List<Object> get props => [message];
}