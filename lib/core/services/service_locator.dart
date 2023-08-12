import 'package:get_it/get_it.dart';
import 'package:todo_list/features/main/data/repositories/get_tasks_repo_impl.dart';
import 'package:todo_list/features/main/domain/repositories/tasks_repo.dart';
import 'package:todo_list/features/main/domain/use_case/add_task_item_use_case.dart';
import 'package:todo_list/features/main/domain/use_case/done_task_use_case.dart';
import 'package:todo_list/features/main/domain/use_case/get_all_task_with_task_type_use_case.dart';
import 'package:todo_list/features/main/domain/use_case/get_task_by_search_use_case.dart';
import 'package:todo_list/features/main/domain/use_case/get_tasks_use_case.dart';
import 'package:todo_list/features/main/domain/use_case/remove_item_use_case.dart';
import 'package:todo_list/features/main/presentation/bloc/get_tasks_bloc.dart';

import '../../features/main/data/data_source/main_local_data_source.dart';

final sl =GetIt.instance;

class ServiceLocator {
  static void init() {


    // Data source
    sl.registerLazySingleton<MainLocalDataSource>(() => MainLocalDataSourceImpl());


    // Repository
    sl.registerLazySingleton<TasksRepository>(() => GetTasksRepositoryImpl(sl()));

    // Use Case
    sl.registerLazySingleton(() => GetTasksUseCase(sl()));
    sl.registerLazySingleton(() => AddTaskItemUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTaskWithTaskTypeUseCase(sl()));
    sl.registerLazySingleton(() => RemoveItemUseCase(sl()));
    sl.registerLazySingleton(() => GetTaskBySearchUseCase(sl()));
    sl.registerLazySingleton(() => DoneTaskUseCase(sl()));
    // Bloc
    sl.registerFactory(() => GetTasksBloc(sl(), sl(), sl(),sl(),sl(),sl()));

  }
}