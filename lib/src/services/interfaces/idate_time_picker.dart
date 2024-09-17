import 'package:flutter/material.dart';

abstract interface class IDateTimePicker {
  Future<DateTime?> showDateTimePicker({required BuildContext context});

  Future<List<DateTime>?> showDateTimeRangePicker(
      {required BuildContext context});
}
