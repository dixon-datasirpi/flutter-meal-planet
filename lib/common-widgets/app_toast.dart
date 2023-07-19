import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  final int timeInSecForIosWeb = 2;

  toastSuccess(String? message, [Color? color]) {
    Fluttertoast.showToast(
      msg: message ?? "Done",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: color ?? Colors.green.shade400,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor:
          "linear-gradient(90deg, rgba(0,111,11,1) 0%, rgba(35,145,0,1) 35%, rgba(7,191,0,1) 100%)",
      webPosition: "center",
    );
    Fluttertoast.cancel();
  }

  toastError(String? message, [Color? color]) {
    Fluttertoast.showToast(
      msg: message ?? "Done",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: color ?? Colors.red.shade400,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor:
          "linear-gradient(90deg, rgba(111,0,0,1) 0%, rgba(145,0,0,1) 35%, rgba(191,0,0,1) 100%)",
      webPosition: "center",
    );
  }
}
