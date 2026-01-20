// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rafaelgaedke/controllers/analytics_controller.dart';
// import 'package:rafaelgaedke/components/consent_dialog.dart';

// class AnalyticsInitializer extends StatelessWidget {
//   final Widget child;
  
//   const AnalyticsInitializer({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     return Obx(() {
//       if (!analyticsController.hasConsent.value) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (context) => const ConsentDialog(),
//           );
//         });
//       }
      
//       return child;
//     });
//   }
// }
