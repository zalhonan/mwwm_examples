import 'package:mwwm_many/domain/scorer.dart';
import 'package:relation/relation.dart';

/// Интерактор взаимодействия со скорерами
class ScorersInteractor {
  /// Инициализируем _scorers как стрим
  final _scorers = StreamedState<Iterable<Scorer>>([]);

  /// Получить список скореров как стрим
  StreamedState<Iterable<Scorer>> getScorers() {
    return _scorers;
  }

  /// добавить скорер - иммутабельно заменяем содержание стрима
  void addScorer() {
    /// временный список
    final tempList = _scorers.value;

    /// конвертация в List, добавление (через ..) нового счетчика
    final resultList = tempList.toList()..add(Scorer(score: 0));

    /// замена содержимого стрима
    _scorers.accept(resultList);
  }

  /// Получить значение определённого скорера
  int getScorerValue(int position) {
    /// через конвертацию в List
    return _scorers.value.toList()[position].score;
  }

  /// Увеличить значение определенного скорера - конвертация, увеличение,
  /// присовение нового состояния стриму
  void increaseScorer(int position) {
    final tempList = _scorers.value.toList();
    tempList[position].score++;
    _scorers.accept(tempList);
  }
}
