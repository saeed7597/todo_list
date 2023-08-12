import 'package:dartz/dartz.dart' as drz;
import 'package:either_dart/src/either.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';

class RemoveItemUseCase extends BaseUseCase<drz.Unit,int> {
  final TasksRepository repository;

  RemoveItemUseCase(this.repository);
  @override
  Future<Either<Failure, drz.Unit>> call(int p)async {
    return await repository.removeItem(p);
  }
  
}