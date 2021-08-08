import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:mwwm_many/ui/screen/scorer_screen/scorer_screen_wm.dart';
import 'package:mwwm_many/domain/scorer.dart';
import 'package:relation/relation.dart';

/// Класс экрана наследует CoreMwwmWidget и типизируется WidgetMoldel-ю
@immutable
class ScorerScreen extends CoreMwwmWidget<ScorerScreenWidgetModel> {
  int current;

  ScorerScreen(this.current, {Key? key})
      : super(
          key: key,
          widgetModelBuilder: (context) =>
              createScorerScreenWidgetModel(context, current),
        );

  @override
  WidgetState<CoreMwwmWidget<ScorerScreenWidgetModel>, ScorerScreenWidgetModel>
      createWidgetState() {
    return _ScorerScreenState();
  }
}

class _ScorerScreenState
    extends WidgetState<ScorerScreen, ScorerScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scorer number ${wm.current + 1}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamedStateBuilder<Iterable<Scorer>>(
              streamedState: wm.scorers,
              builder: (context, scorers) {
                return Text(
                  "${scorers.elementAt(wm.current).score}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// обратиться к функции в WidgetModel также можно через wm.функция
          wm.increaseScorer(wm.current);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
