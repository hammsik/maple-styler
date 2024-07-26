import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

enum ToastType { success, delete, error }

/// 전역으로 사용할 수 있는 토스트 provider
@Riverpod(keepAlive: true)
class CustomToast extends _$CustomToast {
  @override
  FToast build() {
    FToast fToast = FToast();
    return fToast;
  }

  void showCustomToast(BuildContext context,
      {required ToastType type, required String message}) {
    state.removeCustomToast();
    Widget toast = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 79, 79, 79).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 12,
            ),
          ]),
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          type == ToastType.error
              ? const Icon(Icons.error_outline_rounded, color: Colors.redAccent)
              : type == ToastType.delete
                  ? const Icon(Icons.delete_outline_rounded,
                      color: Color.fromARGB(255, 136, 136, 136))
                  : const Icon(Icons.check_circle_outline_rounded,
                      color: Color.fromARGB(255, 100, 186, 106)),
          const SizedBox(width: 10.0),
          Flexible(fit: FlexFit.loose, child: Text(message))
        ],
      ),
    );

    state.init(context);

    state.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
