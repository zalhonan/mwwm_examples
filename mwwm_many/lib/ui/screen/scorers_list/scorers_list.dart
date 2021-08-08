import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:mwwm_many/ui/screen/scorer_screen/scorer_screen.dart';
import 'package:relation/relation.dart';
import 'package:mwwm_many/ui/screen/scorers_list/scorers_list_wm.dart';
import 'package:mwwm_many/domain/scorer.dart';

class ScorersList extends CoreMwwmWidget<ScorersListWidgetModel> {
  ScorersList({Key? key})
      : super(
          key: key,
          widgetModelBuilder: (context) =>
              createScorersListWidgetModel(context),
        );

  @override
  WidgetState<CoreMwwmWidget<ScorersListWidgetModel>, ScorersListWidgetModel>
      createWidgetState() {
    return _ScorersListState();
  }
}

class _ScorersListState
    extends WidgetState<ScorersList, ScorersListWidgetModel> {
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text('+++'),
        onPressed: () {
          wm.addScorer();
        },
      ),
      appBar: AppBar(
        title: const Text('Many сounters (scorers) MWWM demo'),
      ),
      body: StreamedStateBuilder<Iterable<Scorer>>(
        streamedState: wm.scorers,
        builder: (context, scorers) {
          if (scorers != null && scorers.isNotEmpty) {
            return ListView.builder(
              itemCount: scorers.length,
              itemBuilder: (c, i) {
                final el = scorers.elementAt(i);
                return GestureDetector(
                  child: Card(
                    child: ListTile(
                      key: ValueKey(i),
                      leading: Text('${i + 1}', style: TextStyle(fontSize: 24)),
                      title: Text("Scorer's value: ${el.score}"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  onTap: () {
                    wm.openScorer(context, i);
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('Press button +++ to add scorer'),
            );
          }
        },
      ),
    );
  }
}
