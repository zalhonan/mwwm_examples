import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:mwwm_counter/ui/app/app.dart';
import 'package:mwwm_counter/interactor/counter_interactor.dart';

/// В зависимостях создаётся провайдер, предоставляющий интерактор приложению
class AppDependencies extends StatelessWidget {
  final App app;

  const AppDependencies({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterInteractor = CounterInteractor();

    return MultiProvider(
      providers: [
        Provider<CounterInteractor>(create: (_) => counterInteractor),
      ],
      child: app,
    );
  }
}
