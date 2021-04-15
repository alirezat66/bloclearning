part of 'numbers_cubit.dart';

@immutable
abstract class NumbersState {
  const NumbersState();
}

class NumbersInitial extends NumbersState {}

class NumbersLoading extends NumbersState {}

class NumbersLoaded extends NumbersState {
  final int number;
  const NumbersLoaded(this.number);
}
