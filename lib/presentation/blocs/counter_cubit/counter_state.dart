part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterState({required this.counter, required this.transactionCounter});

  copyWith({int counter, int transactionCounter});
}

class CounterInitial extends CounterState {
  const CounterInitial({
    super.counter = 5,
    super.transactionCounter = 0,
  });

  @override
  copyWith({int? counter, int? transactionCounter}) {
    return CounterInitial(
      counter: counter ?? this.counter,
      transactionCounter: transactionCounter ?? this.transactionCounter,
    );
  }

  @override
  List<Object> get props => [counter, transactionCounter];
}
