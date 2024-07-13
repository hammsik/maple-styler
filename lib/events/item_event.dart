// import 'package:elegant_notification/elegant_notification.dart';
// import 'package:elegant_notification/resources/arrays.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:toastification/toastification.dart';

// mixin ItemEvent {
//   void showToast({required String message}) {
//     Fluttertoast.showToast(
//         msg: message,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 136, 136, 136),
//         fontSize: 18,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void showToastification(
//       {required BuildContext context, required String message}) {
//     toastification.show(
//       context: context,
//       type: ToastificationType.error,
//       style: ToastificationStyle.flat,
//       title: Text('Error'),
//       description: Text(message),
//       alignment: Alignment.topCenter,
//       autoCloseDuration: const Duration(seconds: 4),
//       animationBuilder: (
//         context,
//         animation,
//         alignment,
//         child,
//       ) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//       boxShadow: lowModeShadow,
//       pauseOnHover: false,
//     );
//   }

//   void showCustomToast(BuildContext context, String message) {
//     FToast fToast = FToast();
//     fToast.init(context);

//     Widget toast = Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.0),
//           color: const Color.fromARGB(255, 255, 255, 255),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 79, 79, 79).withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ]),
//       padding: EdgeInsets.all(14.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.check),
//           SizedBox(width: 12.0),
//           // Expanded(child: Text(message)),
//           Flexible(fit: FlexFit.loose, child: Text(message))
//         ],
//       ),
//     );

//     fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.TOP,
//       toastDuration: Duration(seconds: 2),
//     );

//     Future.delayed(Duration(seconds: 2), () {
//       fToast.removeCustomToast();
//     });
//     fToast.removeCustomToast();
//   }
// }
