import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

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
          _IncreasedCounter(3),
          SizedBox(height: 10),
          _IncreasedCounter(2),
          SizedBox(height: 10),
          _IncreasedCounter(1),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _IncreasedCounter extends StatelessWidget {
  final int counter;
  const _IncreasedCounter(this.counter);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: '$counter',
        child: Text('+$counter'),
        onPressed: () {
          context.read<CounterCubit>().increasedCounter(counter);
        });
  }
}
