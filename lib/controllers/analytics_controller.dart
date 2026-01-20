// import 'package:get/get.dart';
// import 'package:rafaelgaedke/models/user_visit.dart';
// import 'package:rafaelgaedke/models/user_interaction.dart';
// import 'package:rafaelgaedke/models/analytics_data.dart';
// import 'package:rafaelgaedke/services/analytics_service.dart';

// class AnalyticsController extends GetxController {
//   final AnalyticsService _analyticsService = AnalyticsService.to;
  
//   final RxList<UserVisit> visits = <UserVisit>[].obs;
//   final RxList<UserInteraction> interactions = <UserInteraction>[].obs;
//   final RxList<AnalyticsData> analyticsData = <AnalyticsData>[].obs;
//   final RxBool isLoading = false.obs;
//   final RxBool hasConsent = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     hasConsent.value = _analyticsService.hasUserConsent;
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     isLoading.value = true;
//     try {
//       visits.value = _analyticsService.getVisits();
//       interactions.value = _analyticsService.getInteractions();
//       analyticsData.value = _analyticsService.getAnalyticsData();
//     } catch (e) {
//       print('Erro ao carregar dados de analytics: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> giveConsent() async {
//     await _analyticsService.setUserConsent(true);
//     hasConsent.value = true;
//     await _loadData();
//   }

//   Future<void> revokeConsent() async {
//     await _analyticsService.setUserConsent(false);
//     hasConsent.value = false;
//   }

//   Future<void> trackPageView(String page) async {
//     await _analyticsService.trackPageView(page);
//     await _loadData();
//   }

//   Future<void> trackButtonClick(String buttonName) async {
//     await _analyticsService.trackButtonClick(buttonName);
//     await _loadData();
//   }

//   Future<void> trackLinkClick(String linkUrl) async {
//     await _analyticsService.trackLinkClick(linkUrl);
//     await _loadData();
//   }

//   Future<void> trackFormSubmit(String formName) async {
//     await _analyticsService.trackFormSubmit(formName);
//     await _loadData();
//   }

//   Future<void> trackScroll(int percentage) async {
//     await _analyticsService.trackScroll(percentage);
//     await _loadData();
//   }

//   Future<void> trackTimeOnPage(int seconds) async {
//     await _analyticsService.trackTimeOnPage(seconds);
//     await _loadData();
//   }

//   Future<void> trackEvent(String eventType, {Map<String, dynamic>? properties}) async {
//     await _analyticsService.trackEvent(eventType, properties: properties);
//     await _loadData();
//   }

//   Future<void> exportData() async {
//     await _analyticsService.exportData();
//   }

//   Future<void> clearAllData() async {
//     await _analyticsService.clearAllData();
//     await _loadData();
//   }

//   int get totalVisits => visits.length;
//   int get totalInteractions => interactions.length;
//   int get totalEvents => analyticsData.length;

//   List<UserVisit> getVisitsByDateRange(DateTime start, DateTime end) {
//     return visits.where((visit) => 
//       visit.timestamp.isAfter(start) && visit.timestamp.isBefore(end)
//     ).toList();
//   }

//   List<UserInteraction> getInteractionsByType(String type) {
//     return interactions.where((interaction) => interaction.type == type).toList();
//   }

//   List<AnalyticsData> getEventsByType(String eventType) {
//     return analyticsData.where((data) => data.eventType == eventType).toList();
//   }

//   Map<String, int> getDeviceTypeStats() {
//     final deviceTypes = <String, int>{};
//     for (final visit in visits) {
//       final deviceType = visit.deviceType ?? 'Unknown';
//       deviceTypes[deviceType] = (deviceTypes[deviceType] ?? 0) + 1;
//     }
//     return deviceTypes;
//   }

//   Map<String, int> getBrowserStats() {
//     final browsers = <String, int>{};
//     for (final visit in visits) {
//       final browser = visit.browser ?? 'Unknown';
//       browsers[browser] = (browsers[browser] ?? 0) + 1;
//     }
//     return browsers;
//   }

//   Map<String, int> getOSStats() {
//     final osList = <String, int>{};
//     for (final visit in visits) {
//       final os = visit.os ?? 'Unknown';
//       osList[os] = (osList[os] ?? 0) + 1;
//     }
//     return osList;
//   }

//   Map<String, int> getPageStats() {
//     final pages = <String, int>{};
//     for (final visit in visits) {
//       for (final page in visit.pagesVisited) {
//         pages[page] = (pages[page] ?? 0) + 1;
//       }
//     }
//     return pages;
//   }

//   Map<String, int> getInteractionStats() {
//     final interactionTypes = <String, int>{};
//     for (final interaction in interactions) {
//       final type = interaction.type;
//       interactionTypes[type] = (interactionTypes[type] ?? 0) + 1;
//     }
//     return interactionTypes;
//   }
// }
