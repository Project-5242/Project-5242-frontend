import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:quickalert/quickalert.dart';

class DialogHelper {
  /// Show success alert
  static void showSuccess(BuildContext context,
      {required String message, String? title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: title ?? 'Success',
      text: message,
      confirmBtnText: 'OK',
    );
  }

  /// Show error alert
  static void showError(BuildContext context,
      {required String message, String? title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title ?? 'Error',
      text: message,
      confirmBtnText: 'OK',
    );
  }

  /// Show warning alert
  static void showWarning(BuildContext context,
      {required String message, String? title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: title ?? 'Warning',
      text: message,
      confirmBtnText: 'OK',
    );
  }

  /// Show info alert
  static void showInfo(BuildContext context,
      {required String message, String? title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: title ?? 'Info',
      text: message,
      confirmBtnText: 'OK',
    );
  }

  /// Show confirm alert with custom actions
  static void showConfirmation(
    BuildContext context, {
    required String message,
    String? title,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: title ?? 'Confirm',
      text: message,
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: onConfirm,
      onCancelBtnTap: onCancel ?? () => Navigator.of(context).pop(),
    );
  }

  /// Show loading alert
  static void showLoading(BuildContext context,
      {String? title, String? message}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: title,
      text: message,
    );
  }

  // Dismiss any alert dialog
  static void dismiss(BuildContext context) {
    context.pop();
  }
}
