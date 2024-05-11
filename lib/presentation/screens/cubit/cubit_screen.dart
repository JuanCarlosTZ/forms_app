import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:forms_app/presentation/shares/counter/custom_increased_counter.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return CounterCubit();
        },
        child: _CounterCubitView());
  }
}

class _CounterCubitView extends StatefulWidget {
  @override
  State<_CounterCubitView> createState() => _CounterCubitViewState();
}

class _CounterCubitViewState extends State<_CounterCubitView> {
  late bool animate;

  @override
  void initState() {
    super.initState();
    animate = true;
  }

  void toggleAnimationState() {
    setState(() {
      animate = !animate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Screen: ${counterState.transactionCounter}'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().resetCounter(),
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return FadeInUpBig(
                animate: animate, child: Text('Counter: ${state.counter}'));
          },
        ),
      ),
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
        context.read<CounterCubit>().increasedCounter(counter);
      },
    );
  }
}
