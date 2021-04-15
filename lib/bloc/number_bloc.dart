import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  NumberBloc() : super(NumberInitial());
  @override
  Stream<NumberState> mapEventToState(
    NumberEvent event,
  ) async* {
    if (event is GetRandomNumber) {
      yield NumberLoading();
      int num = await getRandomNumberWithFakeDelay();
      yield NumberLoaded(num);
    }
  }

  Future<int> getRandomNumberWithFakeDelay() {
    return Future.delayed(Duration(milliseconds: 2000)).then((onValue) {
      Random rn = Random();
      return rn.nextInt(10000);
    });
  }
}
