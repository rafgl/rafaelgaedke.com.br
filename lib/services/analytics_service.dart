import 'dart:html' as html;
import 'dart:js' as js;

import 'package:get/get.dart';
import 'package:rafaelgaedke/models/analytics_data.dart';
import 'package:rafaelgaedke/models/user_interaction.dart';
import 'package:rafaelgaedke/models/user_visit.dart';
import 'package:rafaelgaedke/services/firebase_analytics_service.dart';
import 'package:rafaelgaedke/services/storage.dart';
import 'package:uuid/uuid.dart';

class AnalyticsService extends GetxService {
  static AnalyticsService get to => Get.find();

  final _uuid = const Uuid();
  final RxString _currentSessionId = ''.obs;
  final RxString _currentVisitId = ''.obs;
  final RxBool _isTrackingEnabled = true.obs;
  final RxBool _hasUserConsent = false.obs;
  final RxBool _firebaseEnabled = false.obs;

  String get currentSessionId => _currentSessionId.value;
  String get currentVisitId => _currentVisitId.value;
  bool get isTrackingEnabled => _isTrackingEnabled.value;
  bool get hasUserConsent => _hasUserConsent.value;
  bool get firebaseEnabled => _firebaseEnabled.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initializeSession();
    await _checkUserConsent();
    await _initializeFirebase();
  }

  Future<void> _initializeSession() async {
    _currentSessionId.value = _uuid.v4();
    _currentVisitId.value = _uuid.v4();
  }

  Future<void> _checkUserConsent() async {
    final consent = StorageService.box.read('analytics_consent');
    _hasUserConsent.value = consent == true;
    _isTrackingEnabled.value = consent == true;
  }

  Future<void> _initializeFirebase() async {
    try {
      if (Get.isRegistered<FirebaseAnalyticsService>()) {
        _firebaseEnabled.value = true;
        await _sendToFirebase('session_start');
      }
    } catch (e) {
      print('Erro ao inicializar Firebase Analytics: $e');
      _firebaseEnabled.value = false;
    }
  }

  Future<void> setUserConsent(bool consent) async {
    _hasUserConsent.value = consent;
    _isTrackingEnabled.value = consent;
    await StorageService.box.write('analytics_consent', consent);

    if (consent) {
      await _trackPageView();
    }
  }

  Future<void> _sendToFirebase(String eventName, {Map<String, Object>? parameters}) async {
    if (!_firebaseEnabled.value) return;

    try {
      final firebaseService = Get.find<FirebaseAnalyticsService>();
      await firebaseService.logEvent(eventName, parameters: parameters);
    } catch (e) {
      print('Erro ao enviar evento para Firebase: $e');
    }
  }

  Future<void> _trackPageView() async {
    if (!_isTrackingEnabled.value) return;

    try {
      final userAgent = html.window.navigator.userAgent;
      const referrer = '';
      final language = html.window.navigator.language;
      const timezone = '';
      final screenWidth = html.window.screen?.width ?? 0;
      final screenHeight = html.window.screen?.height ?? 0;
      final screenResolution = '${screenWidth}x$screenHeight';

      final isFirstVisit = StorageService.box.read('first_visit') == null;
      if (isFirstVisit) {
        await StorageService.box.write('first_visit', DateTime.now().toIso8601String());
      }

      final visit = UserVisit(
        id: _currentVisitId.value,
        timestamp: DateTime.now(),
        userAgent: userAgent,
        referrer: referrer.isNotEmpty ? referrer : null,
        language: language,
        timezone: timezone,
        screenResolution: screenResolution,
        deviceType: _getDeviceType(userAgent),
        browser: _getBrowser(userAgent),
        os: _getOS(userAgent),
        isFirstVisit: isFirstVisit,
        pagesVisited: [html.window.location.pathname ?? ''],
      );

      await _saveVisitData(visit);
      await trackEvent('page_view', properties: {
        'page': html.window.location.pathname,
        'title': '',
        'url': html.window.location.href,
      });

      // Enviar para Firebase
      await _sendToFirebase('page_view', parameters: {
        'page_name': html.window.location.pathname ?? '',
        'page_url': html.window.location.href,
        'user_agent': userAgent,
        'device_type': _getDeviceType(userAgent),
        'browser': _getBrowser(userAgent),
        'os': _getOS(userAgent),
        'screen_resolution': screenResolution,
        'language': language,
        'is_first_visit': isFirstVisit,
      });
    } catch (e) {
      print('Erro ao capturar dados do usuário: $e');
    }
  }

  Future<void> trackPageView(String page) async {
    if (!_isTrackingEnabled.value) return;

    await trackEvent('page_view', properties: {
      'page': page,
      'title': '',
      'url': html.window.location.href,
    });

    // Enviar para Firebase
    await _sendToFirebase('page_view', parameters: {
      'page_name': page,
      'page_url': html.window.location.href,
    });
  }

  Future<void> trackInteraction(String type, {String? element, Map<String, dynamic>? data}) async {
    if (!_isTrackingEnabled.value) return;

    final interaction = UserInteraction(
      id: _uuid.v4(),
      visitId: _currentVisitId.value,
      timestamp: DateTime.now(),
      type: type,
      page: html.window.location.pathname,
      element: element,
      data: data,
    );

    await _saveInteractionData(interaction);
    await trackEvent('interaction', properties: {
      'type': type,
      'element': element,
      'page': html.window.location.pathname,
      'data': data,
    });

    // Enviar para Firebase
    await _sendToFirebase('interaction', parameters: {
      'interaction_type': type,
      'element_name': element ?? '',
      'page_name': html.window.location.pathname ?? '',
      'interaction_data': data?.toString() ?? '',
    });
  }

  Future<void> trackEvent(String eventType, {Map<String, dynamic>? properties}) async {
    if (!_isTrackingEnabled.value) return;

    final analyticsData = AnalyticsData(
      id: _uuid.v4(),
      timestamp: DateTime.now(),
      eventType: eventType,
      page: html.window.location.pathname,
      properties: properties,
      userId: _currentSessionId.value,
      sessionId: _currentSessionId.value,
    );

    await _saveAnalyticsData(analyticsData);

    // Enviar para Firebase
    await _sendToFirebase(eventType, parameters: properties?.cast<String, Object>());
  }

  Future<void> trackButtonClick(String buttonName) async {
    await trackInteraction('button_click', element: buttonName);

    // Enviar para Firebase
    await _sendToFirebase('button_click', parameters: {
      'button_name': buttonName,
      'page_name': html.window.location.pathname ?? '',
    });
  }

  Future<void> trackLinkClick(String linkUrl) async {
    await trackInteraction('link_click', element: linkUrl);

    // Enviar para Firebase
    await _sendToFirebase('link_click', parameters: {
      'link_url': linkUrl,
      'page_name': html.window.location.pathname ?? '',
    });
  }

  Future<void> trackFormSubmit(String formName) async {
    await trackInteraction('form_submit', element: formName);

    // Enviar para Firebase
    await _sendToFirebase('form_submit', parameters: {
      'form_name': formName,
      'page_name': html.window.location.pathname ?? '',
    });
  }

  Future<void> trackScroll(int percentage) async {
    await trackInteraction('scroll', data: {'percentage': percentage});

    // Enviar para Firebase
    await _sendToFirebase('scroll', parameters: {
      'scroll_percentage': percentage,
      'page_name': html.window.location.pathname ?? '',
    });
  }

  Future<void> trackTimeOnPage(int seconds) async {
    await trackInteraction('time_on_page', data: {'seconds': seconds});

    // Enviar para Firebase
    await _sendToFirebase('time_on_page', parameters: {
      'time_seconds': seconds,
      'page_name': html.window.location.pathname ?? '',
    });
  }

  String _getDeviceType(String userAgent) {
    if (userAgent.contains('Mobile')) return 'mobile';
    if (userAgent.contains('Tablet')) return 'tablet';
    return 'desktop';
  }

  String _getBrowser(String userAgent) {
    if (userAgent.contains('Chrome')) return 'Chrome';
    if (userAgent.contains('Firefox')) return 'Firefox';
    if (userAgent.contains('Safari')) return 'Safari';
    if (userAgent.contains('Edge')) return 'Edge';
    return 'Unknown';
  }

  String _getOS(String userAgent) {
    if (userAgent.contains('Windows')) return 'Windows';
    if (userAgent.contains('Mac')) return 'macOS';
    if (userAgent.contains('Linux')) return 'Linux';
    if (userAgent.contains('Android')) return 'Android';
    if (userAgent.contains('iOS')) return 'iOS';
    return 'Unknown';
  }

  Future<void> _saveVisitData(UserVisit visit) async {
    try {
      final visits = StorageService.box.read('user_visits') ?? [];
      visits.add(visit.toJson());
      await StorageService.box.write('user_visits', visits);
    } catch (e) {
      print('Erro ao salvar dados da visita: $e');
    }
  }

  Future<void> _saveInteractionData(UserInteraction interaction) async {
    try {
      final interactions = StorageService.box.read('user_interactions') ?? [];
      interactions.add(interaction.toJson());
      await StorageService.box.write('user_interactions', interactions);
    } catch (e) {
      print('Erro ao salvar dados da interação: $e');
    }
  }

  Future<void> _saveAnalyticsData(AnalyticsData analyticsData) async {
    try {
      final analytics = StorageService.box.read('analytics_data') ?? [];
      analytics.add(analyticsData.toJson());
      await StorageService.box.write('analytics_data', analytics);
    } catch (e) {
      print('Erro ao salvar dados de analytics: $e');
    }
  }

  List<UserVisit> getVisits() {
    try {
      final visits = StorageService.box.read('user_visits') ?? [];
      return visits.map<UserVisit>((visit) => UserVisit.fromJson(visit)).toList();
    } catch (e) {
      print('Erro ao recuperar visitas: $e');
      return [];
    }
  }

  List<UserInteraction> getInteractions() {
    try {
      final interactions = StorageService.box.read('user_interactions') ?? [];
      return interactions.map<UserInteraction>((interaction) => UserInteraction.fromJson(interaction)).toList();
    } catch (e) {
      print('Erro ao recuperar interações: $e');
      return [];
    }
  }

  List<AnalyticsData> getAnalyticsData() {
    try {
      final analytics = StorageService.box.read('analytics_data') ?? [];
      return analytics.map<AnalyticsData>((data) => AnalyticsData.fromJson(data)).toList();
    } catch (e) {
      print('Erro ao recuperar dados de analytics: $e');
      return [];
    }
  }

  Future<void> clearAllData() async {
    await StorageService.box.remove('user_visits');
    await StorageService.box.remove('user_interactions');
    await StorageService.box.remove('analytics_data');
    await StorageService.box.remove('analytics_consent');
    await StorageService.box.remove('first_visit');
  }

  Future<void> exportData() async {
    final data = {
      'visits': getVisits().map((v) => v.toJson()).toList(),
      'interactions': getInteractions().map((i) => i.toJson()).toList(),
      'analytics': getAnalyticsData().map((a) => a.toJson()).toList(),
      'exportedAt': DateTime.now().toIso8601String(),
    };

    final jsonString = js.context['JSON'].callMethod('stringify', [data]);
    final blob = html.Blob([jsonString], 'application/json');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)..setAttribute('download', 'analytics_data_${DateTime.now().millisecondsSinceEpoch}.json');
    anchor.click();

    html.Url.revokeObjectUrl(url);
  }
}
