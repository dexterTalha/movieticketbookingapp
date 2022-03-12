import 'dart:convert';

class MenuModel {
  final String name;
  final String asset;
  MenuModel({
    required this.name,
    required this.asset,
  });

  MenuModel copyWith({
    String? name,
    String? asset,
  }) {
    return MenuModel(
      name: name ?? this.name,
      asset: asset ?? this.asset,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'asset': asset,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      name: map['name'] ?? '',
      asset: map['asset'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));

  @override
  String toString() => 'MenuModel(name: $name, asset: $asset)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuModel && other.name == name && other.asset == asset;
  }

  @override
  int get hashCode => name.hashCode ^ asset.hashCode;
}
