import 'package:basic_bloc/src/app_route.dart';
import 'package:basic_bloc/src/bloc/app_bloc_observer.dart';
import 'package:basic_bloc/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:basic_bloc/src/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(const MyApp());
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterABloc = BlocProvider<CounterABloc>(create: (context)=> CounterABloc());
    return MultiBlocProvider(
      providers: [counterABloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
