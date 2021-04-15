import 'dart:math';

import 'package:bloc_cubit_learning/bloc/number_bloc.dart';
import 'package:bloc_cubit_learning/cubit/numbers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int randomNumber = 5;
  bool isLoading = false;
  // NumberBloc _numberBloc;
  NumbersCubit _numberCubit;
  @override
  void initState() {
    //  _numberBloc = BlocProvider.of<NumberBloc>(context);
    _numberCubit = context.read<NumbersCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NumbersCubit, NumbersState>(
      listener: (context, state) {
        if (state is NumbersLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is NumbersLoaded) {
          setState(() {
            randomNumber = state.number;
            isLoading = false;
          });
        }
      },
      child: Scaffold(
        body: isLoading ? LoadingWidget() : bodyOfResult(context),
      ),
    );
  }

  Column bodyOfResult(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // _numberBloc.add(GetRandomNumber());
            _numberCubit.getRandomNumber();
          },
          child: Text('Get new Random Number'),
        ),
        SizedBox(height: 20, width: MediaQuery.of(context).size.width),
        Text('$randomNumber')
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20, width: MediaQuery.of(context).size.width),
        Text('Loading')
      ],
    );
  }
}
