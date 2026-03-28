/*class OriginModel {
  final String name;
  final String url;

  OriginModel({required this.name, required this.url});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(name: json['name'] ?? '', url: json['url'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }

  OriginModel copyWith({String? name, String? url}) {
    return OriginModel(name: name ?? this.name, url: url ?? this.url);
  }
}*/

import 'package:hive/hive.dart';

part 'origin_model.g.dart';

@HiveType(typeId: 1)
class OriginModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  OriginModel({
    required this.name,
    required this.url,
  });

  factory OriginModel.fromJson(
      Map<String, dynamic> json) {

    return OriginModel(
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

  OriginModel copyWith({String? name, String? url}) {
    return OriginModel(name: name ?? this.name, url: url ?? this.url);
  }
}
