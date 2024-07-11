import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

@Riverpod(keepAlive: true)
class CustomToast extends _$CustomToast {
  @override
  FToast build() {
    FToast fToast = FToast();
    return fToast;
  }

  void showCustomToast(BuildContext context, String message) {
    state.removeCustomToast();
    Widget toast = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 79, 79, 79).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(width: 12.0),
          // Expanded(child: Text(message)),
          Flexible(fit: FlexFit.loose, child: Text(message))
        ],
      ),
    );

    state.init(context);

    state.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
      
    );
  }
}
