import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increasedCounter(int counter) {
    emit(state.copyWith(
      counter: state.counter + counter,
      transactionCounter: state.transactionCounter + 1,
    ));
  }

  void resetCounter() {
    emit(state.copyWith(counter: 0));
  }
}
