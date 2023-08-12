import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/core/models/base_use_case.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';
import 'package:todo_list/features/main/domain/use_case/done_task_use_case.dart';

import '../../domain/use_case/add_task_item_use_case.dart';
import '../../domain/use_case/get_all_task_with_task_type_use_case.dart';
import '../../domain/use_case/get_task_by_search_use_case.dart';
import '../../domain/use_case/get_tasks_use_case.dart';
import '../../domain/use_case/remove_item_use_case.dart';

part 'get_tasks_event.dart';
part 'get_tasks_state.dart';

class GetTasksBloc extends Bloc<GetTasksEvent, GetTasksState> {
  final AddTaskItemUseCase _addTaskItemUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final GetAllTaskWithTaskTypeUseCase _getAllTaskWithTaskType;
  final RemoveItemUseCase _removeItemUseCase;
  final GetTaskBySearchUseCase _getTaskBySearchUseCase;
  final DoneTaskUseCase _doneTaskUseCase;
  GetTasksBloc(
      this._addTaskItemUseCase,
      this._getTasksUseCase,
      this._getAllTaskWithTaskType,
      this._removeItemUseCase,
      this._getTaskBySearchUseCase,
      this._doneTaskUseCase
      ) : super(GetTasksInitial()) {
    on<AddNewTaskEvent>(_addNewTask);
    on<GetTasksWithTaskTypeEvent>(_getTaskWithTaskType);
    on<GetAllTasksEvent>(_getAllTasks);
    on<RemoveItemEvent>(_removeItem);
    on<GetTaskBySearchEvent>(_getTasksSearch);
    on<DoneTaskEvent>(_doneTask);

  }

  Future<void> _addNewTask(AddNewTaskEvent event,Emitter<GetTasksState> emit) async {
    emit(AddNewTaskLoading());
    final result = await _addTaskItemUseCase.call(event.taskEntity);
    result.fold(
            (failure) => emit(AddNewTaskError(message: failure.message)),
            (success) => emit(AddedNewTask())
    );
  }
  Future<void> _getTaskWithTaskType(GetTasksWithTaskTypeEvent event,Emitter<GetTasksState> emit) async {
    emit(GetTasksWithTaskTypeLoading());
    final result = _getAllTaskWithTaskType.call(event.typeTask);
    result.fold(
            (failure) => emit(GetTasksWithTaskTypeError(message: failure.message)),
            (item) => emit(GetTasksWithTaskType(taskItem: item))
    );
  }

  Future<void> _getAllTasks(GetTasksEvent event,Emitter<GetTasksState> emit) async{
    emit(GetAllTasksLoading());
    final result = _getTasksUseCase.call(const NoParams());
    result.fold(
            (failure) => emit(GetAllTasksError(message: failure.message)),
            (right) => emit(GetAllTasksSuccess(allTasks: right))
    );
  }

  Future<void> _removeItem(RemoveItemEvent event,Emitter<GetTasksState> emit)async {
    emit(RemoveItem());
    final result = await _removeItemUseCase.call(event.index);
    result.fold(
            (failure) => emit(RemoveItemFailure(message: failure.message)),
            (right) => emit(RemoveItemSuccess()));
  }

  Future<void> _getTasksSearch(GetTaskBySearchEvent event,Emitter<GetTasksState> emit)async {
    emit(GetTaskBySearchLoading());
    final result = await _getTaskBySearchUseCase(event.search);
    result.fold(
            (failure) => emit(GetTaskBySearchFailure(failure.message)),
            (success) => emit(GetTaskBySearchSuccess(allTasks: success))
    );
  }

  Future<void> _doneTask(DoneTaskEvent event,Emitter<GetTasksState> emit)async {
    await _doneTaskUseCase.call(0);
  }


}
