// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDTOAdapter extends TypeAdapter<TaskDTO> {
  @override
  final int typeId = 0;

  @override
  TaskDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDTO(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      isCompleted: fields[3] as bool,
      category: fields[4] as TaskCategoryDTO,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDTO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
