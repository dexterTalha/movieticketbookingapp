import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final String title;
  final String description;
  final List<String> actors;
  final int like;
  final String bannerUrl;
  final List<String> screens;
  MovieModel({
    required this.title,
    required this.description,
    required this.actors,
    required this.like,
    required this.bannerUrl,
    this.screens = const [
      "3D",
      "2D",
    ],
  });

  MovieModel copyWith({
    String? title,
    String? description,
    List<String>? actors,
    int? like,
    String? bannerUrl,
    List<String>? screens,
  }) {
    return MovieModel(
      title: title ?? this.title,
      description: description ?? this.description,
      actors: actors ?? this.actors,
      like: like ?? this.like,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      screens: screens ?? this.screens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'actors': actors,
      'like': like,
      'bannerUrl': bannerUrl,
      'screens': screens,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      actors: List<String>.from(map['actors']),
      like: map['like']?.toInt() ?? 0,
      bannerUrl: map['bannerUrl'] ?? '',
      screens: List<String>.from(map['screens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(title: $title, description: $description, actors: $actors, like: $like, bannerUrl: $bannerUrl, screens: $screens)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.description == description &&
        listEquals(other.actors, actors) &&
        other.like == like &&
        other.bannerUrl == bannerUrl &&
        listEquals(other.screens, screens);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        actors.hashCode ^
        like.hashCode ^
        bannerUrl.hashCode ^
        screens.hashCode;
  }
}
