import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

class AddTaskItemUseCase extends BaseUseCase<int,TaskEntity> {
  final TasksRepository _tasksRepository;
  AddTaskItemUseCase(this._tasksRepository);
  @override
  Future<Either<Failure, int>> call(TaskEntity p) async{
    return await _tasksRepository.addTaskItem(p);
  }

}