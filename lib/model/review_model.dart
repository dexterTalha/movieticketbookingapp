import 'dart:convert';

class ReviewModel {
  final String userId;
  final DateTime reviewDate;
  final String description;
  ReviewModel({
    required this.userId,
    required this.reviewDate,
    required this.description,
  });

  ReviewModel copyWith({
    String? userId,
    DateTime? reviewDate,
    String? description,
  }) {
    return ReviewModel(
      userId: userId ?? this.userId,
      reviewDate: reviewDate ?? this.reviewDate,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'reviewDate': reviewDate.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      userId: map['userId'] ?? '',
      reviewDate: DateTime.fromMillisecondsSinceEpoch(map['reviewDate']),
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) => ReviewModel.fromMap(json.decode(source));

  @override
  String toString() => 'ReviewModel(userId: $userId, reviewDate: $reviewDate, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReviewModel &&
        other.userId == userId &&
        other.reviewDate == reviewDate &&
        other.description == description;
  }

  @override
  int get hashCode => userId.hashCode ^ reviewDate.hashCode ^ description.hashCode;
}
