import 'package:flutter/material.dart';
import '../screen/counter_screen/counter_screen.dart';

/// стандарный material App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MWWM Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}
