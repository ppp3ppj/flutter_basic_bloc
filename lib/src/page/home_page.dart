import 'package:basic_bloc/src/app_route.dart';
import 'package:basic_bloc/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Navigator.pushNamed(context, AppRoute.another), icon: Icon(Icons.skip_next))],
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterABloc, CounterAState>(
  builder: (context, state) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter A',
            ),
                Text(
                  // '${state.count}',
                  '${state.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      );
  },
),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterABloc>().add(CounterAEventReset()),
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () => context.read<CounterABloc>().add(CounterAEventAdd()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
