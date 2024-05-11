import 'package:flutter/material.dart';
import 'package:forms_app/presentation/providers/counter_provider.dart';
import 'package:forms_app/presentation/shares/counter/custom_increased_counter.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (_) {
            return CounterProvider.initState();
          },
        )
      ],
      child: const _CounterProviderView(),
    );
  }
}

class _CounterProviderView extends StatelessWidget {
  const _CounterProviderView();

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen: ${counterProvider.transactionCounter}'),
        actions: [
          IconButton(
              onPressed: counterProvider.resetCounterProvider,
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: Text('Counter: ${counterProvider.counter}')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _IncreasedAction(
            counter: 3,
            onPressed: () {
              context.read<CounterProvider>().increasedCounterProvider(3);
            },
          ),
          const SizedBox(height: 10),
          _IncreasedAction(
            counter: 2,
            onPressed: () {
              context.read<CounterProvider>().increasedCounterProvider(2);
            },
          ),
          const SizedBox(height: 10),
          _IncreasedAction(
            counter: 1,
            onPressed: () {
              context.read<CounterProvider>().increasedCounterProvider(1);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _IncreasedAction extends StatelessWidget {
  final int counter;
  final VoidCallback? onPressed;
  const _IncreasedAction({required this.counter, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomIncreasedCounter(
      counter: counter,
      onPressed: onPressed,
    );
  }
}
