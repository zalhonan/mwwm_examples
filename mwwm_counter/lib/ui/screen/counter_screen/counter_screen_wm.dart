import 'package:flutter/cupertino.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';

import 'package:mwwm_counter/interactor/counter_interactor.dart';

/// Класс-состояние для страницы с вёрсткой
class CounterScreenWidgetModel extends WidgetModel {
  /// Инициализация CounterInteractor, который будет содержать сосотяние счетчика
  final CounterInteractor _counterInteractor;

  /// Состояние каунтера переводится в стрим
  Stream<int> counter() => _counterInteractor.counter.stream;

  /// конструктор WidgeModel (создается в IDE через Create constructor co call super)
  /// принимает CounterInteractor
  CounterScreenWidgetModel(
      WidgetModelDependencies baseDependencies, this._counterInteractor)
      : super(baseDependencies);

  /// функция - инкремент каунтера. Обращается к интерактору.
  void incrementCounter() {
    _counterInteractor.incrementCounter();
  }
}

/// функция - создание WidgetModel. Используется в CounterScreen
CounterScreenWidgetModel createCounterScreenWidgetModel(
  BuildContext context,
) {
  return CounterScreenWidgetModel(
    const WidgetModelDependencies(),

    /// запрос интерактора из провайдера
    context.read<CounterInteractor>(),
  );
}
