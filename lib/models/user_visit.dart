class UserVisit {
  final String id;
  final DateTime timestamp;
  final String? userAgent;
  final String? referrer;
  final String? language;
  final String? timezone;
  final String? screenResolution;
  final String? deviceType;
  final String? browser;
  final String? os;
  final String? country;
  final String? city;
  final String? ipAddress;
  final bool isFirstVisit;
  final int sessionDuration;
  final List<String> pagesVisited;
  final List<String> interactions;

  UserVisit({
    required this.id,
    required this.timestamp,
    this.userAgent,
    this.referrer,
    this.language,
    this.timezone,
    this.screenResolution,
    this.deviceType,
    this.browser,
    this.os,
    this.country,
    this.city,
    this.ipAddress,
    this.isFirstVisit = false,
    this.sessionDuration = 0,
    this.pagesVisited = const [],
    this.interactions = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'userAgent': userAgent,
      'referrer': referrer,
      'language': language,
      'timezone': timezone,
      'screenResolution': screenResolution,
      'deviceType': deviceType,
      'browser': browser,
      'os': os,
      'country': country,
      'city': city,
      'ipAddress': ipAddress,
      'isFirstVisit': isFirstVisit,
      'sessionDuration': sessionDuration,
      'pagesVisited': pagesVisited,
      'interactions': interactions,
    };
  }

  factory UserVisit.fromJson(Map<String, dynamic> json) {
    return UserVisit(
      id: json['id'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
      userAgent: json['userAgent'],
      referrer: json['referrer'],
      language: json['language'],
      timezone: json['timezone'],
      screenResolution: json['screenResolution'],
      deviceType: json['deviceType'],
      browser: json['browser'],
      os: json['os'],
      country: json['country'],
      city: json['city'],
      ipAddress: json['ipAddress'],
      isFirstVisit: json['isFirstVisit'] ?? false,
      sessionDuration: json['sessionDuration'] ?? 0,
      pagesVisited: List<String>.from(json['pagesVisited'] ?? []),
      interactions: List<String>.from(json['interactions'] ?? []),
    );
  }
}
