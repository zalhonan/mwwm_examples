import 'package:flutter/material.dart';
import 'package:mwwm_many/ui/screen/scorers_list/scorers_list.dart';

/// стандарный material App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MWWM Demo - many counters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScorersList(),
    );
  }
}
