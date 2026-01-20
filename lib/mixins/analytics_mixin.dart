// import 'package:get/get.dart';
// import 'package:rafaelgaedke/controllers/analytics_controller.dart';

// mixin AnalyticsMixin {

//   void trackPageView(String page) {
//     analyticsController.trackPageView(page);
//   }

//   void trackButtonClick(String buttonName, {Map<String, dynamic>? data}) {
//     analyticsController.trackButtonClick(buttonName);
//     if (data != null) {
//       analyticsController.trackEvent('button_click', properties: {
//         'button_name': buttonName,
//         ...data,
//       });
//     }
//   }

//   void trackLinkClick(String linkUrl, {Map<String, dynamic>? data}) {
//     analyticsController.trackLinkClick(linkUrl);
//     if (data != null) {
//       analyticsController.trackEvent('link_click', properties: {
//         'link_url': linkUrl,
//         ...data,
//       });
//     }
//   }

//   void trackFormSubmit(String formName, {Map<String, dynamic>? data}) {
//     analyticsController.trackFormSubmit(formName);
//     if (data != null) {
//       analyticsController.trackEvent('form_submit', properties: {
//         'form_name': formName,
//         ...data,
//       });
//     }
//   }

//   void trackScroll(int percentage) {
//     analyticsController.trackScroll(percentage);
//   }

//   void trackTimeOnPage(int seconds) {
//     analyticsController.trackTimeOnPage(seconds);
//   }

//   void trackEvent(String eventType, {Map<String, dynamic>? properties}) {
//     analyticsController.trackEvent(eventType, properties: properties);
//   }

//   void trackCustomInteraction(String type, {String? element, Map<String, dynamic>? data}) {
//     analyticsController.trackEvent('custom_interaction', properties: {
//       'type': type,
//       'element': element,
//       'data': data,
//     });
//   }
// }
