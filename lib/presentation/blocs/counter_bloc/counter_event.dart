part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class IncreasedCounterEvent extends CounterEvent {
  final int value;
  IncreasedCounterEvent({required this.value});
}

class ResetCounterEvent extends CounterEvent {
  ResetCounterEvent();
}
