import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class FirebaseAnalyticsService extends GetxService {
  static FirebaseAnalyticsService get to => Get.find();

  late FirebaseAnalytics _analytics;
  late FirebaseAnalyticsObserver _observer;

  FirebaseAnalytics get analytics => _analytics;
  FirebaseAnalyticsObserver get observer => _observer;

  @override
  Future<void> onInit() async {
    super.onInit();
    _analytics = FirebaseAnalytics.instance;
    _observer = FirebaseAnalyticsObserver(analytics: _analytics);
  }

  Future<void> logPageView(String pageName, {String? pageClass}) async {
    try {
      await _analytics.logScreenView(
        screenName: pageName,
        screenClass: pageClass,
      );
    } catch (e) {
      print('Erro ao enviar page_view para Firebase: $e');
    }
  }

  Future<void> logEvent(String eventName, {Map<String, Object>? parameters}) async {
    try {
      await _analytics.logEvent(
        name: eventName,
        parameters: parameters,
      );
    } catch (e) {
      print('Erro ao enviar evento para Firebase: $e');
    }
  }

  Future<void> logButtonClick(String buttonName, {String? pageName}) async {
    await logEvent('button_click', parameters: {
      'button_name': buttonName,
      'page_name': pageName ?? '',
    });
  }

  Future<void> logLinkClick(String linkUrl, {String? linkText}) async {
    await logEvent('link_click', parameters: {
      'link_url': linkUrl,
      'link_text': linkText ?? '',
    });
  }

  Future<void> logFormSubmit(String formName, {Map<String, Object>? formData}) async {
    await logEvent('form_submit', parameters: {
      'form_name': formName,
      ...?formData,
    });
  }

  Future<void> logScroll(int percentage, {String? pageName}) async {
    await logEvent('scroll', parameters: {
      'scroll_percentage': percentage,
      'page_name': pageName ?? '',
    });
  }

  Future<void> logTimeOnPage(int seconds, {String? pageName}) async {
    await logEvent('time_on_page', parameters: {
      'time_seconds': seconds,
      'page_name': pageName ?? '',
    });
  }

  Future<void> logCustomEvent(
    String eventName, {
    String? category,
    String? action,
    String? label,
    int? value,
    Map<String, Object>? customParameters,
  }) async {
    final parameters = <String, Object>{
      if (category != null) 'category': category,
      if (action != null) 'action': action,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      ...?customParameters,
    };

    await logEvent(eventName, parameters: parameters);
  }

  Future<void> setUserProperty(String name, String? value) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
    } catch (e) {
      print('Erro ao definir propriedade do usuário: $e');
    }
  }

  Future<void> setUserId(String? userId) async {
    try {
      await _analytics.setUserId(id: userId);
    } catch (e) {
      print('Erro ao definir ID do usuário: $e');
    }
  }

  Future<void> logUserEngagement() async {
    await logEvent('user_engagement');
  }

  Future<void> logSessionStart() async {
    await logEvent('session_start');
  }

  Future<void> logSessionEnd() async {
    await logEvent('session_end');
  }
}
