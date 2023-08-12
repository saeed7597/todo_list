import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

class GetAllTaskWithTaskTypeUseCase extends BaseUseCase<List<TaskEntity>,TypeTask> {
  final TasksRepository _tasksRepository;

  GetAllTaskWithTaskTypeUseCase(this._tasksRepository);
  @override
  Future<Either<Failure, List<TaskEntity>>> call(TypeTask p) async{
    return await _tasksRepository.getAllTaskWithTaskType(p);
  }


}