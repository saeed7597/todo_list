import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/features/main/presentation/bloc/get_tasks_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/task_entity.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key,required this.typeTask}) : super(key: key);
  final TypeTask typeTask;


  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  Color getPriority(LevelTask taskLevel) {
    if(taskLevel == LevelTask.low) {
      return Colors.blue;
    }else if (taskLevel == LevelTask.normal) {
      return Colors.orange;
    }else {
      return Colors.red;
    }
  }

  double opacity = 1;


  DismissDirection direction = DismissDirection.startToEnd;
  @override
  Widget build(BuildContext context) {
    List<TaskEntity> listTask = [];
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) =>sl<GetTasksBloc>(),
        child: BlocBuilder<GetTasksBloc,GetTasksState>(
            builder: (context,state){
              if (state is GetTasksInitial || state is RemoveItemSuccess) {
                BlocProvider.of<GetTasksBloc>(context).add(GetTasksWithTaskTypeEvent(typeTask: widget.typeTask));
              }
              if(state is GetTasksWithTaskType) {
                if (state.taskItem.isNotEmpty) {
                  listTask = state.taskItem;
                }else {
                  listTask = [];
                }
              }
              if (listTask.isNotEmpty) {
                return ListView.builder(
                    itemCount: listTask.length,
                    itemBuilder: (context,index) {
                      return Dismissible(
                        onDismissed: (dir) {
                          if (dir == DismissDirection.startToEnd) {
                            BlocProvider.of<GetTasksBloc>(context).add(GetTasksWithTaskTypeEvent(typeTask: widget.typeTask));
                          }else if (dir == DismissDirection.endToStart) {
                            context.read<GetTasksBloc>().add(RemoveItemEvent(index: (listTask.length - 1 ) - index));
                          }

                        },
                        background: Container(
                          color: Colors.green,
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                        ),
                        key: UniqueKey(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: getPriority(listTask[index].levelTask),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: ListTile(
                                dense: true,
                                leading: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          context.read<GetTasksBloc>().add(const DoneTaskEvent());
                                        });
                                      },
                                      icon:  Icon(listTask[index].doneTask ? Icons.check : null,color: Colors.green,size: 20,),
                                      padding: EdgeInsets.zero,
                                    )
                                ),
                                title: Text(listTask[index].title,style:themeData.textTheme.titleLarge!.copyWith(color: Colors.white,decoration: listTask[index].doneTask ? TextDecoration.lineThrough : null),),
                                subtitle: Text(listTask[index].description,style: themeData.textTheme.labelMedium!.copyWith(color: Colors.white,decoration: listTask[index].doneTask ? TextDecoration.lineThrough : null)),
                                trailing: IconButton(
                                    onPressed: (){
                                      context.read<GetTasksBloc>().add(RemoveItemEvent(index: (listTask.length - 1 ) - index));

                                    }, icon: const Icon(Icons.delete_forever,color: Colors.white,)),
                              )
                          ),
                        ),
                      );
                    }
                );
              }else {
                return const Center(child: Text('Not Tasks'),);
              }
            }
        ),
      )
    );
  }
}
