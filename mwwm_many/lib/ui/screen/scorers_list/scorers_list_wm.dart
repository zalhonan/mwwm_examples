import 'package:flutter/cupertino.dart';
import 'package:mwwm/mwwm.dart';
import 'package:mwwm_many/ui/screen/scorer_screen/scorer_screen.dart';
import 'package:mwwm_many/ui/screen/scorer_screen/scorer_screen_route.dart';
import 'package:relation/relation.dart';
import 'package:provider/provider.dart';

import 'package:mwwm_many/domain/scorer.dart';
import 'package:mwwm_many/interactor/scorers_interactor.dart';

import 'package:flutter/material.dart';

class ScorersListWidgetModel extends WidgetModel {
  final ScorersInteractor _scorersInteractor;

  /// поздняя инициализация - мы получим это в конструкторе и зафиксируем как final
  late final scorers;

  ScorersListWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._scorersInteractor,
  ) : super(baseDependencies) {
    /// проксирование стрима из интерактора
    scorers = _scorersInteractor.getScorers();
  }

  /// инктеремент счетчика
  void increaseScorer(int position) {
    _scorersInteractor.increaseScorer(position);
  }

  /// Добавление счетчика
  Future<void> addScorer() async {
    _scorersInteractor.addScorer();
  }

  /// открыть счетчик через его Route
  void openScorer(BuildContext context, int current) {
    Navigator.push(
      context,
      ScorerScreenRoute(current),
    );
  }
}

ScorersListWidgetModel createScorersListWidgetModel(
  BuildContext context,
) {
  return ScorersListWidgetModel(
    const WidgetModelDependencies(),
    context.read<ScorersInteractor>(),
  );
}
