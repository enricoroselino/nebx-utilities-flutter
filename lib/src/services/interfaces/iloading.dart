import 'package:flutter/material.dart';

abstract interface class ILoading {
  bool isVisible(BuildContext context);

  void show(BuildContext context);

  void hide(BuildContext context);

  Future<T> wrap<T>(BuildContext context, Future<T> Function() operation);
}
