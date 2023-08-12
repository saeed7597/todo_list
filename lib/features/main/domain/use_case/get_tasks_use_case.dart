import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';

import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

class GetTasksUseCase extends BaseUseCase<List<TaskEntity>,NoParams> {
  final TasksRepository getTasksRepository;
  GetTasksUseCase(this.getTasksRepository);
  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams p)async {
    return await getTasksRepository.getAllTasks();
  }
  
}