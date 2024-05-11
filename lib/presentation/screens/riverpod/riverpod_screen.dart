import 'package:flutter/material.dart';
import 'package:forms_app/presentation/riverpod/couter_riverpod/counter_riverpod.dart';
import 'package:forms_app/presentation/shares/counter/custom_increased_counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({super.key});

  void reserCounterRiverpod(WidgetRef ref) {
    ref.read(counterRiverpod.notifier).update((_) => 0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterRiverpod);
    final transactionCounter = ref.watch(transactionCounterRiverpod);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Screen: ${transactionCounter}'),
        actions: [
          IconButton(
              onPressed: () => reserCounterRiverpod(ref),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: Text('Counter: $counter')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _IncreasedAction(counter: 3, ref: ref),
          const SizedBox(height: 10),
          _IncreasedAction(counter: 2, ref: ref),
          const SizedBox(height: 10),
          _IncreasedAction(counter: 1, ref: ref),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _IncreasedAction extends StatelessWidget {
  final int counter;
  final WidgetRef ref;
  const _IncreasedAction({required this.counter, required this.ref});

  @override
  Widget build(BuildContext context) {
    return CustomIncreasedCounter(
      counter: counter,
      onPressed: () {
        increasedCounter(ref, counter);
      },
    );
  }
}
