import 'package:basic_bloc/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:basic_bloc/src/bloc/counter_b_bloc/counter_b_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key, required this.title});
  final String title;

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterABloc, CounterAState>(
  builder: (context, counterAState) {
    return BlocBuilder<CounterBBloc, CounterBState>(
  builder: (context, counterBState) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Counter A',
                ),
                    Text(
                      // '${state.count}',
                      '${counterAState.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Counter B',
                ),
                Text(
                  // '${state.count}',
                  '${counterBState.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      );
  },
);
  },
),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "A-Restore",
                onPressed: () => context.read<CounterABloc>().add(CounterAEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
                heroTag: "A-Add",
                onPressed: () => context.read<CounterABloc>().add(CounterAEventAdd()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "B-Restore",
                onPressed: () => context.read<CounterBBloc>().add(CounterBEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
                heroTag: "B-Add",
                onPressed: () => context.read<CounterBBloc>().add(CounterBEventAdd()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
