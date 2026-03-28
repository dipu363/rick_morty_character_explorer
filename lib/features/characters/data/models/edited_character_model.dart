class EditedCharacterModel {
  final int id;

  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? originName;
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
