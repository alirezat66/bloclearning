part of 'number_bloc.dart';

@immutable
abstract class NumberState {
  const NumberState();
}

class NumberInitial extends NumberState {}

class NumberLoading extends NumberState {}

class NumberLoaded extends NumberState {
  final int number;
  const NumberLoaded(this.number);
}
