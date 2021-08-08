import 'package:flutter/material.dart';
import './ui/app/app.dart';
import 'package:mwwm_counter/ui/app/app_dependencies.dart';

/// К приложению сразу привязываются зависимости. В данном случае - интерактор
void main() {
  runApp(
    AppDependencies(
      app: App(),
    ),
  );
}
