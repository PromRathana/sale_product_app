import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageUtil {
  static showMessageError(String message) {
    Get.snackbar(
      "ERROR",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static showMessageSuccess(String message) {
    Get.snackbar(
      "SUCCESS",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // static confirmMessageDialog({
  //   VoidCallback? onConfirm,
  //   VoidCallback? onCancel,
  //   String? title,
  //   String? middleText,
  //   String? textConfirm,
  //   String? textCancel,
  // }) {
  //   Get.defaultDialog(
  //     title: title ?? "",
  //     middleText: middleText ?? "",
  //     textConfirm: textConfirm,
  //     textCancel: textCancel,
  //     onConfirm: onConfirm,
  //     onCancel: onCancel,
  //   );
  // }
  static void confirmMessageDialog({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? title,
    String? middleText,
    String? textConfirm,
    String? textCancel,
  }) {
    Get.defaultDialog(
      title: title ?? "Confirm",
      titleStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      middleText: middleText ?? "",
      middleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      radius: 12,

      // Confirm Button (Destructive)
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          onConfirm?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        child: Text(
          textConfirm ?? "Confirm",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // Cancel Button
      cancel: OutlinedButton(
        onPressed: () {
          Get.back();
          onCancel?.call();
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        child: Text(
          textCancel ?? "Cancel",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}
