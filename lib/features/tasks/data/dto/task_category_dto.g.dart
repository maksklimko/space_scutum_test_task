// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_category_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryDTOAdapter extends TypeAdapter<TaskCategoryDTO> {
  @override
  final int typeId = 1;

  @override
  TaskCategoryDTO read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskCategoryDTO.all;
      case 1:
        return TaskCategoryDTO.work;
      case 2:
        return TaskCategoryDTO.personal;
      case 3:
        return TaskCategoryDTO.other;
      default:
        return TaskCategoryDTO.all;
    }
  }

  @override
  void write(BinaryWriter writer, TaskCategoryDTO obj) {
    switch (obj) {
      case TaskCategoryDTO.all:
        writer.writeByte(0);
        break;
      case TaskCategoryDTO.work:
        writer.writeByte(1);
        break;
      case TaskCategoryDTO.personal:
        writer.writeByte(2);
        break;
      case TaskCategoryDTO.other:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
