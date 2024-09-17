import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:nebx_utilities/src/services/interfaces/inative_dialog.dart';

class NativeDialogImplementation implements INativeDialog {
  @override
  Future<bool> confirmation({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    final clickedButton = await FlutterPlatformAlert.showAlert(
      windowTitle: title,
      text: content,
      alertStyle: AlertButtonStyle.yesNo,
      iconStyle: IconStyle.question,
    );

    return clickedButton == AlertButton.noButton ? false : true;
  }

  @override
  Future<void> info({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    FlutterPlatformAlert.showAlert(windowTitle: title, text: content);
  }
}
