import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterStates>(
      bloc: counterBloc,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text(
                'Counter',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              backgroundColor: Colors.black,
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    counterBloc.add(NumberIncreaseEvent());
                  },
                  child: const Icon(Icons.add, color: Colors.red),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    counterBloc.add(NumberResetEvent());
                  },
                  child: const Icon(Icons.refresh, color: Colors.red),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    counterBloc.add(NumberDecreaseEvent());
                  },
                  child: const Icon(Icons.remove, color: Colors.red),
                ),
              ],
            ),
            body: Center(
                child: Text(
              state is UpdateState ? state.counter.toString() : '0',
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            )));
      },
    );
  }
}
