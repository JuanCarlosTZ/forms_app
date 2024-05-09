import 'package:flutter/material.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Screen'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: const Center(child: Text('Counter: 4')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+1'), onPressed: () {}),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '2', child: const Text('+1'), onPressed: () {}),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () {}),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
