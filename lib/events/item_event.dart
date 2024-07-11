import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ItemEvent {
  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 136, 136, 136),
        fontSize: 18,
        toastLength: Toast.LENGTH_SHORT);
  }
}
