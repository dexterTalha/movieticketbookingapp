import 'dart:convert';

class EventModel {
  final String title;
  final String description;
  final String bannerUrl;
  final String date;
  EventModel({
    required this.title,
    required this.description,
    required this.bannerUrl,
    required this.date,
  });

  EventModel copyWith({
    String? title,
    String? description,
    String? bannerUrl,
    String? date,
  }) {
    return EventModel(
      title: title ?? this.title,
      description: description ?? this.description,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'bannerUrl': bannerUrl,
      'date': date,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      bannerUrl: map['bannerUrl'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(title: $title, description: $description, bannerUrl: $bannerUrl, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.title == title &&
        other.description == description &&
        other.bannerUrl == bannerUrl &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^ description.hashCode ^ bannerUrl.hashCode ^ date.hashCode;
  }
}
