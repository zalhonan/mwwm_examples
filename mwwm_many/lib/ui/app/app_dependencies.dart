import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:mwwm_many/ui/app/app.dart';
import 'package:mwwm_many/interactor/scorers_interactor.dart';

/// В зависимостях создаётся провайдер, предоставляющий интерактор приложению
class AppDependencies extends StatelessWidget {
  final App app;

  const AppDependencies({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scorerInteractor = ScorersInteractor();

    return MultiProvider(
      providers: [
        Provider<ScorersInteractor>(create: (_) => scorerInteractor),
      ],
      child: app,
    );
  }
}
