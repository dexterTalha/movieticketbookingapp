import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheatreModel {
  final String id;
  final String name;
  final LatLng coordinates;
  final List<String> facilites;
  final String fullAddress;
  final List<String> timings;
  final List<String> avalableScreens;
  TheatreModel({
    required this.id,
    required this.name,
    this.coordinates = const LatLng(26.753547, 83.3730171),
    this.facilites = const [
      "Cancel",
      "Parking",
      "Hotel",
      "Park",
    ],
    this.fullAddress = "City Mall, 2 nd floor Park Road, Civil Lines, Golghar, Gorakhpur, Uttar Pradesh 273001",
    this.timings = const [
      "10:00 AM",
      "1:30 PM",
      "6:30 PM",
      "9:30 PM",
      "12:30 AM",
    ],
    this.avalableScreens = const [
      "3D",
      "2D",
    ],
  });

  TheatreModel copyWith({
    String? id,
    String? name,
    LatLng? coordinates,
    List<String>? facilites,
    String? fullAddress,
    List<String>? timings,
    List<String>? avalableScreens,
  }) {
    return TheatreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
      facilites: facilites ?? this.facilites,
      fullAddress: fullAddress ?? this.fullAddress,
      timings: timings ?? this.timings,
      avalableScreens: avalableScreens ?? this.avalableScreens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coordinates': coordinates,
      'facilites': facilites,
      'fullAddress': fullAddress,
      'timings': timings,
      'avalableScreens': avalableScreens,
    };
  }

  factory TheatreModel.fromMap(Map<String, dynamic> map) {
    return TheatreModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      coordinates: map['coordinates'],
      facilites: List<String>.from(map['facilites']),
      fullAddress: map['fullAddress'] ?? '',
      timings: List<String>.from(map['timings']),
      avalableScreens: List<String>.from(map['avalableScreens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TheatreModel.fromJson(String source) => TheatreModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TheatreModel(id: $id, name: $name, coordinates: $coordinates, facilites: $facilites, fullAddress: $fullAddress, timings: $timings, avalableScreens: $avalableScreens)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TheatreModel &&
        other.id == id &&
        other.name == name &&
        other.coordinates == coordinates &&
        listEquals(other.facilites, facilites) &&
        other.fullAddress == fullAddress &&
        listEquals(other.timings, timings) &&
        listEquals(other.avalableScreens, avalableScreens);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coordinates.hashCode ^
        facilites.hashCode ^
        fullAddress.hashCode ^
        timings.hashCode ^
        avalableScreens.hashCode;
  }
}
