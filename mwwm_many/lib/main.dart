import 'package:flutter/material.dart';
import 'package:mwwm_many/ui/app/app.dart';
import 'package:mwwm_many/ui/app/app_dependencies.dart';

/// К приложению сразу привязываются зависимости. В данном случае - интерактор
void main() {
  runApp(
    AppDependencies(
      app: App(),
    ),
  );
}
