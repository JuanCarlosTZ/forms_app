import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:forms_app/presentation/shares/counter/custom_increased_counter.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) {
          return CounterBloc();
        },
        child: const _CounterBlocView());
  }
}

class _CounterBlocView extends StatelessWidget {
  const _CounterBlocView();

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen: ${counterState.transactionCounter}'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterBloc>().add(ResetCounterEvent());
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: Text('Counter: ${counterState.counter}')),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _IncreasedAction(counter: 3),
          SizedBox(height: 10),
          _IncreasedAction(counter: 2),
          SizedBox(height: 10),
          _IncreasedAction(counter: 1),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _IncreasedAction extends StatelessWidget {
  final int counter;
  const _IncreasedAction({required this.counter});

  @override
  Widget build(BuildContext context) {
    return CustomIncreasedCounter(
      counter: counter,
      onPressed: () {
        context.read<CounterBloc>().add(IncreasedCounterEvent(value: counter));
      },
    );
  }
}
