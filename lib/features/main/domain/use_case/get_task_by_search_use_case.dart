import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

class GetTaskBySearchUseCase extends BaseUseCase<List<TaskEntity>,String> {
  TasksRepository repository;
  GetTaskBySearchUseCase(this.repository);
  @override
  Future<Either<Failure, List<TaskEntity>>> call(String p) {
    return  repository.getTaskBySearch(p);
  }

}