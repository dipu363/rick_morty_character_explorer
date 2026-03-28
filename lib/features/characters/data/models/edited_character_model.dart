import 'package:hive/hive.dart';

part 'edited_character_model.g.dart';

@HiveType(typeId: 3)
class EditedCharacterModel {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? status;

  @HiveField(3)
  final String? species;

  @HiveField(4)
  final String? type;

  @HiveField(5)
  final String? gender;

  @HiveField(6)
  final String? originName;

  @HiveField(7)
  final String? locationName;

  EditedCharacterModel({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.originName,
    this.locationName,
  });

  factory EditedCharacterModel.fromJson(
      Map<String, dynamic> json) {

    return EditedCharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      originName: json['originName'],
      locationName: json['locationName'],
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
      'originName': originName,
      'locationName': locationName,
    };
  }
}