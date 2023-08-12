part of 'get_tasks_bloc.dart';

abstract class GetTasksState extends Equatable {
  const GetTasksState();
}

class GetTasksInitial extends GetTasksState {
  @override
  List<Object> get props => [];
}

class AddNewTaskLoading extends GetTasksState {
  @override
  List<Object?> get props => [];
}

class AddNewTaskError extends GetTasksState {
  final String message;

  const AddNewTaskError({required this.message});

  @override
  List<Object?> get props => [message];
}

class AddedNewTask extends GetTasksState {
  @override
  List<Object?> get props => [];

}

class GetTasksWithTaskType extends GetTasksState {

  final List<TaskEntity> taskItem;

  const GetTasksWithTaskType({required this.taskItem});
  @override
  List<Object?> get props => [taskItem];
}

class GetTasksWithTaskTypeLoading extends GetTasksState {
  @override
  List<Object?> get props => [];

}

class GetTasksWithTaskTypeError extends GetTasksState {
  final String message;
  const GetTasksWithTaskTypeError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class GetAllTasksLoading extends GetTasksState {

  @override
  List<Object?> get props => [];

}

class GetAllTasksSuccess extends GetTasksState {
  final List<TaskEntity> allTasks;

  const GetAllTasksSuccess({required this.allTasks});
  @override
  List<Object?> get props => [allTasks];

}

class GetAllTasksError extends GetTasksState {
  final String message;

  const GetAllTasksError({required this.message});
  @override
  List<Object?> get props => [message];
}

class RemoveItem extends GetTasksState {
  @override
  List<Object?> get props => [];
}

class RemoveItemSuccess extends GetTasksState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class RemoveItemFailure extends GetTasksState {
  final String message;
  const RemoveItemFailure({required this.message});

  @override
  List<Object?> get props => [message];

}

class GetTaskBySearchLoading extends GetTasksState {
  @override
  List<Object?> get props => [];

}

class GetTaskBySearchFailure extends GetTasksState {
  final String message;
  const GetTaskBySearchFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class GetTaskBySearchSuccess extends GetTasksState {
  final List<TaskEntity> allTasks;

  const GetTaskBySearchSuccess({required this.allTasks});

  @override
  List<Object?> get props => [allTasks];
}