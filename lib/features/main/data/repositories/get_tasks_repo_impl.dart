
import 'package:dartz/dartz.dart' as drz;
import 'package:either_dart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/features/main/data/data_source/main_local_data_source.dart';
import 'package:todo_list/features/main/data/models/task_model.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

import '../../domain/entities/task_entity.dart';

class GetTasksRepositoryImpl extends TasksRepository {

  final MainLocalDataSource _mainLocalDataSource;

  GetTasksRepositoryImpl(this._mainLocalDataSource);

  @override
  Future<Either<Failure, int>> addTaskItem(TaskEntity taskEntity) async{
    try {
      int id = await _mainLocalDataSource.addTaskItem(TaskModel.fromEntity(taskEntity));
      return Right(id);
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async{
    try {
      return Right(await _mainLocalDataSource.getAllTask());
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTaskWithTaskType(TypeTask typeTask) async{
    try {
      return Right(await _mainLocalDataSource.getTaskModelWithTaskType(typeTask));
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, drz.Unit>> removeItem(int index)async {

    try {
      await _mainLocalDataSource.removeItem(index);
      return const Right(drz.unit);
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }


  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTaskBySearch(String keyword)async {
    try{
      return Right(await _mainLocalDataSource.getTaskBySearch(keyword));
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, drz.Unit>> doneTask()async{
    try {
      await _mainLocalDataSource.doneTask();
      return const Right(drz.unit);
    }on HiveError catch(failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }



  





}