import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:dartz/dartz.dart' as drz;

import '../repositories/tasks_repo.dart';
class DoneTaskUseCase extends BaseUseCase<drz.Unit,int> {
  final TasksRepository repository;
  DoneTaskUseCase(this.repository);
  @override
  Future<Either<Failure, drz.Unit>> call(int p) {
    return repository.doneTask();
  }

}