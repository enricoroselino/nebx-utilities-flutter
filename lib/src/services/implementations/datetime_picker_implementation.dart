import 'package:flutter/material.dart';
import 'package:nebx_utilities/nebx_utilities.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class DateTimePickerImplementation implements IDateTimePicker {
  DateTime get _firstDate =>
      DateTime(1600).subtract(const Duration(days: 3652));

  DateTime get _lastDate => DateTime.now().add(const Duration(days: 3652));

  DateTime get _initialDate => DateTime.now();

  @override
  Future<DateTime?> showDateTimePicker({required BuildContext context}) async {
    if (!context.mounted) return null;

    return await showOmniDateTimePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: _firstDate,
      lastDate: _lastDate,
      is24HourMode: true,
      isShowSeconds: false,
      barrierDismissible: true,
    );
  }

  @override
  Future<List<DateTime>?> showDateTimeRangePicker({
    required BuildContext context,
  }) async {
    if (!context.mounted) return null;

    return await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: _initialDate,
      startFirstDate: _firstDate,
      startLastDate: _lastDate,
      endInitialDate: _initialDate,
      endFirstDate: _firstDate,
      endLastDate: _lastDate,
      is24HourMode: true,
      isShowSeconds: false,
      barrierDismissible: true,
    );
  }
}
