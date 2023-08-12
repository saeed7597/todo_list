import 'package:hive/hive.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';
class TaskModel extends TaskEntity {
  TaskModel({
    required super.title,
    required super.description,
    required super.levelTask,
    required super.typeTask,
    required super.currentDate,
    required super.doneTask
  });

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(
        title: taskEntity.title,
        description: taskEntity.description,
        levelTask: taskEntity.levelTask,
        typeTask: taskEntity.typeTask,
        currentDate: taskEntity.currentDate,
        doneTask: taskEntity.doneTask
    );
  }
}