part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  final int transactionCounter;
  const CounterState({required this.counter, required this.transactionCounter});

  CounterState copyWith({int? counter, int? transactionCounter});

  @override
  List<Object> get props => [counter, transactionCounter];
}

final class CounterInitial extends CounterState {
  const CounterInitial({super.counter = 10, super.transactionCounter = 0});

  @override
  CounterInitial copyWith({int? counter, int? transactionCounter}) =>
      CounterInitial(
        counter: counter ?? this.counter,
        transactionCounter: transactionCounter ?? this.transactionCounter,
      );
}
