// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edited_character_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EditedCharacterModelAdapter extends TypeAdapter<EditedCharacterModel> {
  @override
  final int typeId = 3;

  @override
  EditedCharacterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EditedCharacterModel(
      id: fields[0] as int,
      name: fields[1] as String?,
      status: fields[2] as String?,
      species: fields[3] as String?,
      type: fields[4] as String?,
      gender: fields[5] as String?,
      originName: fields[6] as String?,
      locationName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EditedCharacterModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.originName)
      ..writeByte(7)
      ..write(obj.locationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditedCharacterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
