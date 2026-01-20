class UserInteraction {
  final String id;
  final String visitId;
  final DateTime timestamp;
  final String type;
  final String? page;
  final String? element;
  final Map<String, dynamic>? data;
  final int? duration;

  UserInteraction({
    required this.id,
    required this.visitId,
    required this.timestamp,
    required this.type,
    this.page,
    this.element,
    this.data,
    this.duration,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'visitId': visitId,
      'timestamp': timestamp.toIso8601String(),
      'type': type,
      'page': page,
      'element': element,
      'data': data,
      'duration': duration,
    };
  }

  factory UserInteraction.fromJson(Map<String, dynamic> json) {
    return UserInteraction(
      id: json['id'] ?? '',
      visitId: json['visitId'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
      type: json['type'] ?? '',
      page: json['page'],
      element: json['element'],
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
      duration: json['duration'],
    );
  }
}
