import 'package:dartz/dartz.dart' as drz;
import 'package:either_dart/either.dart';
import 'package:todo_list/core/error/failure.dart';

import 'package:todo_list/features/main/domain/entities/task_entity.dart';

import '../../data/models/task_model.dart';

abstract class TasksRepository {

  Future<Either<Failure,List<TaskEntity>>> getAllTasks();
  Future<Either<Failure,int>> addTaskItem(TaskEntity taskEntity);
  Future<Either<Failure,List<TaskEntity>>> getAllTaskWithTaskType(TypeTask typeTask);
  Future<Either<Failure,drz.Unit>> removeItem(int index);
  Future<Either<Failure,List<TaskEntity>>> getTaskBySearch(String keyword);
  Future<Either<Failure,drz.Unit>> doneTask();
}