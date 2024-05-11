import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter;
  int transactionCounter;

  CounterProvider({
    required this.counter,
    required this.transactionCounter,
  });

  void increasedCounterProvider(int value) {
    counter = counter + value;
    transactionCounter++;

    notifyListeners();
  }

  void resetCounterProvider() {
    counter = 0;
    notifyListeners();
  }

  static CounterProvider initState() => CounterProvider(
        counter: 1,
        transactionCounter: 1,
      );
}
