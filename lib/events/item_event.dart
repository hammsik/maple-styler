import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

mixin ItemEvent {
  void showToast(BuildContext context, String message, Widget icon) {
    CherryToast.success(
      title: Text(
        "해당 아이템이 등록되었습니다",
        style: TextStyle(color: Colors.black),
      ),
      toastPosition: Position.bottom,
      animationType: AnimationType.fromBottom,
      animationCurve: Curves.easeOutCirc,
      animationDuration: const Duration(milliseconds: 500),
      toastDuration: const Duration(seconds: 2),
    ).show(context);
  }
}
