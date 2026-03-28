/*import 'origin_model.dart';
import 'location_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginModel origin;
  final LocationModel location;
  final String image;
  final String? note;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.note,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin: OriginModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
    };
  }

  CharacterModel copyWith({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginModel? origin,
    LocationModel? location,
    String? note,
  }) {
    return CharacterModel(
      id: id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image,
      note: note ?? this.note,
    );
  }
}*/
import 'package:hive/hive.dart';

import 'origin_model.dart';
import 'location_model.dart';

part 'character_model.g.dart';

@HiveType(typeId: 0)
class CharacterModel {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final OriginModel origin;

  @HiveField(7)
  final LocationModel location;

  @HiveField(8)
  final String image;

  @HiveField(9)
  final String? note;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.note,
  });

  factory CharacterModel.fromJson(
      Map<String, dynamic> json) {

    return CharacterModel(
      id: json['id'],
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      type: json['type'] ?? '',
      gender: json['gender'] ?? '',
      origin:
      OriginModel.fromJson(json['origin']),
      location:
      LocationModel.fromJson(json['location']),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
      'note': note,
    };
  }

  CharacterModel copyWith({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginModel? origin,
    LocationModel? location,
    String? note,
  }) {

    return CharacterModel(
      id: id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image,
      note: note ?? this.note,
    );
  }
}