// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_userinfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoggedUserAdapter extends TypeAdapter<LoggedUser> {
  @override
  final int typeId = 1;

  @override
  LoggedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedUser()
      .._uid = fields[0] as String
      .._age = fields[1] as int
      .._gender = fields[2] as String
      .._name = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, LoggedUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._uid)
      ..writeByte(1)
      ..write(obj._age)
      ..writeByte(2)
      ..write(obj._gender)
      ..writeByte(3)
      ..write(obj._name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
