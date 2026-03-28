/*class LocationModel {
  final String name;
  final String url;

  LocationModel({required this.name, required this.url});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'] ?? '', url: json['url'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }

  LocationModel copyWith({String? name, String? url}) {
    return LocationModel(name: name ?? this.name, url: url ?? this.url);
  }
}*/

import 'package:hive/hive.dart';

part 'location_model.g.dart';

@HiveType(typeId: 2)
class LocationModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  LocationModel({
    required this.name,
    required this.url,
  });

  factory LocationModel.fromJson(
      Map<String, dynamic> json) {

    return LocationModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'name': name,
      'url': url,
    };
  }

  LocationModel copyWith({String? name, String? url}) {
    return LocationModel(name: name ?? this.name, url: url ?? this.url);
  }
}
