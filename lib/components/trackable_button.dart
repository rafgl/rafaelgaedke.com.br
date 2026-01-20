// import 'package:flutter/material.dart';

// class TrackableButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final String? trackingName;
//   final Map<String, dynamic>? trackingData;
//   final ButtonStyle? style;
//   final Widget? child;

//   const TrackableButton({
//     Key? key,
//     required this.text,
//     this.onPressed,
//     this.trackingName,
//     this.trackingData,
//     this.style,
//     this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         if (onPressed != null) {
//           onPressed!();
//         }

//         final name = trackingName ?? text;

//         if (trackingData != null) {}
//       },
//       style: style,
//       child: child ?? Text(text),
//     );
//   }
// }
