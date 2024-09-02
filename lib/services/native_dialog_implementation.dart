import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

abstract interface class IDialog {
  Future<bool> confirmation(
    String title,
    String content, {
    BuildContext? context,
  });
}

class NativeDialogImplementation implements IDialog {
  @override
  Future<bool> confirmation(
    String title,
    String content, {
    BuildContext? context,
  }) async {
    if (context != null && !context.mounted) return false;

    final clickedButton = await FlutterPlatformAlert.showAlert(
      windowTitle: title,
      text: content,
      alertStyle: AlertButtonStyle.yesNo,
      iconStyle: IconStyle.question,
    );

    return clickedButton == AlertButton.noButton ? false : true;
  }
}
