import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:movieticketbookingapp/utils/mytheme.dart';

class OfferModel {
  final String title;
  final String description;
  final DateTime expiry;
  final DateTime startTime;
  final double discount;
  final Color color;
  final List<Color> gradientColor;
  final String icon;
  OfferModel({
    required this.title,
    required this.description,
    required this.expiry,
    required this.startTime,
    required this.discount,
    this.color = MyTheme.redTextColor,
    required this.gradientColor,
    this.icon = "gift_red.svg",
  });

  OfferModel copyWith({
    String? title,
    String? description,
    DateTime? expiry,
    DateTime? startTime,
    double? discount,
    Color? color,
    List<Color>? gradientColor,
    String? icon,
  }) {
    return OfferModel(
      title: title ?? this.title,
      description: description ?? this.description,
      expiry: expiry ?? this.expiry,
      startTime: startTime ?? this.startTime,
      discount: discount ?? this.discount,
      color: color ?? this.color,
      gradientColor: gradientColor ?? this.gradientColor,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'expiry': expiry.millisecondsSinceEpoch,
      'startTime': startTime.millisecondsSinceEpoch,
      'discount': discount,
      'color': color.value,
      'gradientColor': gradientColor.map((x) => x.value).toList(),
      'icon': icon,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      expiry: DateTime.fromMillisecondsSinceEpoch(map['expiry']),
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      discount: map['discount']?.toDouble() ?? 0.0,
      color: Color(map['color']),
      gradientColor: List<Color>.from(map['gradientColor']?.map((x) => Color(x))),
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) => OfferModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfferModel(title: $title, description: $description, expiry: $expiry, startTime: $startTime, discount: $discount, color: $color, gradientColor: $gradientColor, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferModel &&
        other.title == title &&
        other.description == description &&
        other.expiry == expiry &&
        other.startTime == startTime &&
        other.discount == discount &&
        other.color == color &&
        listEquals(other.gradientColor, gradientColor) &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        expiry.hashCode ^
        startTime.hashCode ^
        discount.hashCode ^
        color.hashCode ^
        gradientColor.hashCode ^
        icon.hashCode;
  }
}
