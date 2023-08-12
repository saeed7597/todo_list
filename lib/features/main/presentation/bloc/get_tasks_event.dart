part of 'get_tasks_bloc.dart';

abstract class GetTasksEvent extends Equatable {
  const GetTasksEvent();
}

class AddNewTaskEvent extends GetTasksEvent {
  final TaskEntity taskEntity;
  const AddNewTaskEvent({required this.taskEntity});

  @override
  List<Object?> get props => [taskEntity];
}

class GetTasksWithTaskTypeEvent extends GetTasksEvent {

  final TypeTask typeTask;
  const GetTasksWithTaskTypeEvent({required this.typeTask});

  @override
  List<Object?> get props => [typeTask];

}

class GetAllTasksEvent extends GetTasksEvent {

  @override
  List<Object?> get props => [];

}

class RemoveItemEvent extends GetTasksEvent {
  final int index;
  const RemoveItemEvent({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];

}

class GetTaskBySearchEvent extends GetTasksEvent {
  final String search;
  const GetTaskBySearchEvent(this.search);
  @override
  List<Object?> get props =>[search];
}

class DoneTaskEvent extends GetTasksEvent {
  const DoneTaskEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}