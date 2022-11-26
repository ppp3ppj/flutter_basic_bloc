import 'package:basic_bloc/src/page/another_page.dart';
import 'package:basic_bloc/src/page/home_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const home = 'home';
  static const another = 'another';

  final _route = <String, WidgetBuilder>{
    home: (context) => HomePage(title: "HomePage"),
    another: (context) => AnotherPage(title: "AnotherPage",),

  };

  get getAll => _route;
}