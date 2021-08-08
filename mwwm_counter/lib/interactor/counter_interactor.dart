import 'package:relation/relation.dart';

/// Интерактор для заимодействия со счетчиком
class CounterInteractor {
  /// инициализация каунтера как стрима int-ов с начальным значеним 0
  final counter = StreamedState<int>(0);

  /// функция - инкремент каунтера
  void incrementCounter() {
    counter.accept(counter.value + 1);
  }
}
