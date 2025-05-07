import 'package:flutter/material.dart';
import 'package:get/get.dart';

kShowSnackbar({required String message, String? title}) => Get.showSnackbar(
  GetSnackBar(
    title: title,
    message: message,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.green,
  ),
);
