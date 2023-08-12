// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 0;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      title: fields[1] as String,
      description: fields[2] as String,
      levelTask: fields[3] as LevelTask,
      typeTask: fields[4] as TypeTask,
      currentDate: fields[5] as DateTime,
      doneTask: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.levelTask)
      ..writeByte(4)
      ..write(obj.typeTask)
      ..writeByte(5)
      ..write(obj.currentDate)
      ..writeByte(6)
      ..write(obj.doneTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LevelTaskAdapter extends TypeAdapter<LevelTask> {
  @override
  final int typeId = 1;

  @override
  LevelTask read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LevelTask.high;
      case 1:
        return LevelTask.normal;
      case 2:
        return LevelTask.low;
      default:
        return LevelTask.high;
    }
  }

  @override
  void write(BinaryWriter writer, LevelTask obj) {
    switch (obj) {
      case LevelTask.high:
        writer.writeByte(0);
        break;
      case LevelTask.normal:
        writer.writeByte(1);
        break;
      case LevelTask.low:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeTaskAdapter extends TypeAdapter<TypeTask> {
  @override
  final int typeId = 2;

  @override
  TypeTask read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeTask.school;
      case 1:
        return TypeTask.work;
      case 2:
        return TypeTask.shop;
      case 3:
        return TypeTask.read;
      case 4:
        return TypeTask.workOut;
      default:
        return TypeTask.school;
    }
  }

  @override
  void write(BinaryWriter writer, TypeTask obj) {
    switch (obj) {
      case TypeTask.school:
        writer.writeByte(0);
        break;
      case TypeTask.work:
        writer.writeByte(1);
        break;
      case TypeTask.shop:
        writer.writeByte(2);
        break;
      case TypeTask.read:
        writer.writeByte(3);
        break;
      case TypeTask.workOut:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
