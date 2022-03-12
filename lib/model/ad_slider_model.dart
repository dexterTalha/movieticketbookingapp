import 'dart:convert';

class AdSliderModel {
  final String url;
  final String redirectUrl;
  AdSliderModel({
    required this.url,
    required this.redirectUrl,
  });

  AdSliderModel copyWith({
    String? url,
    String? redirectUrl,
  }) {
    return AdSliderModel(
      url: url ?? this.url,
      redirectUrl: redirectUrl ?? this.redirectUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'redirectUrl': redirectUrl,
    };
  }

  factory AdSliderModel.fromMap(Map<String, dynamic> map) {
    return AdSliderModel(
      url: map['url'] ?? '',
      redirectUrl: map['redirectUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdSliderModel.fromJson(String source) => AdSliderModel.fromMap(json.decode(source));

  @override
  String toString() => 'AdSliderModel(url: $url, redirectUrl: $redirectUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdSliderModel && other.url == url && other.redirectUrl == redirectUrl;
  }

  @override
  int get hashCode => url.hashCode ^ redirectUrl.hashCode;
}
