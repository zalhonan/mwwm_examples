import 'package:flutter/material.dart';
import 'package:mwwm_many/ui/screen/scorer_screen/scorer_screen.dart';

/// Роут для [ScorerScreen]
class ScorerScreenRoute extends MaterialPageRoute {
  ScorerScreenRoute(int current)
      : super(
          builder: (context) => ScorerScreen(current),
        );
}
