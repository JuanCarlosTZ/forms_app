import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncreasedCounterEvent>((event, emit) => _increasedCounter(event, emit));
    on<ResetCounterEvent>((event, emit) => _resetCounter(event, emit));
  }

  void _increasedCounter(
      IncreasedCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCounter: state.transactionCounter + 1,
    ));
  }

  void _resetCounter(ResetCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }
}
