import 'package:flutter/material.dart';

abstract interface class INativeDialog {
  Future<bool> confirmation({
    required BuildContext context,
    required String title,
    required String content,
  });

  Future<void> info({
    required BuildContext context,
    required String title,
    required String content,
  });
}
