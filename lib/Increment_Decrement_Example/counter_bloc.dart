import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialState(counter: 0)) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onNumberDecrease);
    on<NumberResetEvent>(onNumberReset);
  }

  void onNumberIncrease(NumberIncreaseEvent event, Emitter<CounterStates> emit) async {
    emit(UpdateState(counter: state.counter + 1));
  }

  void onNumberDecrease(NumberDecreaseEvent event, Emitter<CounterStates> emit) async {
    if (state.counter > 0) {
      emit(UpdateState(counter: state.counter - 1));
    }
  }

  void onNumberReset(NumberResetEvent event, Emitter<CounterStates> emit) async {
    emit(UpdateState(counter: 0));
  }
}
