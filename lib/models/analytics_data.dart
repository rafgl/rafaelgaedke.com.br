class AnalyticsData {
  final String id;
  final DateTime timestamp;
  final String eventType;
  final String? page;
  final Map<String, dynamic>? properties;
  final String? userId;
  final String? sessionId;

  AnalyticsData({
    required this.id,
    required this.timestamp,
    required this.eventType,
    this.page,
    this.properties,
    this.userId,
    this.sessionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'eventType': eventType,
      'page': page,
      'properties': properties,
      'userId': userId,
      'sessionId': sessionId,
    };
  }

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      id: json['id'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
      eventType: json['eventType'] ?? '',
      page: json['page'],
      properties: json['properties'] != null ? Map<String, dynamic>.from(json['properties']) : null,
      userId: json['userId'],
      sessionId: json['sessionId'],
    );
  }
}
