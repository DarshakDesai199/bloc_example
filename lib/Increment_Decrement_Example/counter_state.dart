part of 'counter_bloc.dart';

abstract class CounterStates {
  final int counter;
  const CounterStates({required this.counter});
}

class InitialState extends CounterStates {
  InitialState({required super.counter});
}

class UpdateState extends CounterStates {
  UpdateState({required super.counter});
}
