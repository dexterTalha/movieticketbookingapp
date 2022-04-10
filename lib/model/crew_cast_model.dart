import 'dart:convert';

class CrewCastModel {
  final String movieId;
  final String castId;
  final String name;
  final String image;
  CrewCastModel({
    required this.movieId,
    required this.castId,
    required this.name,
    required this.image,
  });

  CrewCastModel copyWith({
    String? movieId,
    String? castId,
    String? name,
    String? image,
  }) {
    return CrewCastModel(
      movieId: movieId ?? this.movieId,
      castId: castId ?? this.castId,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'castId': castId,
      'name': name,
      'image': image,
    };
  }

  factory CrewCastModel.fromMap(Map<String, dynamic> map) {
    return CrewCastModel(
      movieId: map['movieId'] ?? '',
      castId: map['castId'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CrewCastModel.fromJson(String source) => CrewCastModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CrewCastModel(movieId: $movieId, castId: $castId, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CrewCastModel &&
        other.movieId == movieId &&
        other.castId == castId &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode {
    return movieId.hashCode ^ castId.hashCode ^ name.hashCode ^ image.hashCode;
  }
}
