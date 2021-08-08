import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:weather/error_handlers/exceptions.dart';

/// Обработчик ошибок на уровне приложения
/// Выдает снекбары разного цвета в зависимости от типа ошибки
/// Черный - если проблемы с локацией (сервис не знает город)
/// Красный - другие ошибки (сетевые, геолокатор, всё остальное)
class AppErrorHandler implements ErrorHandler {
  final BuildContext context;
  AppErrorHandler({
    required this.context,
  });

  void handleError(Object e) {
    if (e is ClientNetworkException) {
      showBlackSnackbar("Location is not available. Try anoter location.");
    } else if (e is ServerNetworkException) {
      showRedSnackbar("Network error. Try again later");
    } else if (e is GeolocationException) {
      showRedSnackbar(
          "Geolocation is not allowed. Allow geolocation and try again");
    } else {
      showRedSnackbar(e.toString());
    }
  }

  void showBlackSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showRedSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red[900],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
