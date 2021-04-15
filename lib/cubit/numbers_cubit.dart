import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'numbers_state.dart';

class NumbersCubit extends Cubit<NumbersState> {
  NumbersCubit() : super(NumbersInitial());

  void getRandomNumber() async {
    emit(NumbersLoading());
    int number = await _getRandomNumberWithFakeDelay();
    emit(NumbersLoaded(number));
  }

  Future<int> _getRandomNumberWithFakeDelay() {
    return Future.delayed(Duration(milliseconds: 2000)).then((onValue) {
      Random rn = Random();
      return rn.nextInt(10000);
    });
  }
}
