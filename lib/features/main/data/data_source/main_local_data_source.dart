import 'package:hive/hive.dart';
import 'package:todo_list/features/main/data/models/task_model.dart';
import 'package:todo_list/features/main/domain/entities/task_entity.dart';

abstract class MainLocalDataSource  {

  Future<List<TaskModel>> getAllTask();
  Future<int> addTaskItem(TaskModel taskModel);
  Future<List<TaskModel>> getTaskModelWithTaskType(TypeTask typeTask);
  Future<void> removeItem(int index);
  Future<List<TaskModel>> getTaskBySearch(String keyword);
  Future<void> doneTask();
}

class MainLocalDataSourceImpl extends MainLocalDataSource {
  final Box _box = Hive.box('tasks');

  @override
  Future<List<TaskModel>> getAllTask() async {
    return _box.values.map((e) => TaskModel.fromEntity(e)).toList().reversed.toList();
  }

  @override
  Future<int> addTaskItem(TaskModel taskModel) async{
    _box.values.map((e) => TaskModel.fromEntity(e)).toList().add(taskModel);
    return await _box.add(taskModel);
  }

  @override
  Future<List<TaskModel>> getTaskModelWithTaskType(TypeTask typeTask)async {

    return _box.values.map(
            (e) => TaskModel.fromEntity(e))
        .where((element) => element.typeTask == typeTask).toList().reversed.toList();
  }

  @override
  Future<void> removeItem(int index) async {
    return await _box.deleteAt(index);
  }

  @override
  Future<List<TaskModel>> getTaskBySearch(String keyword)async {
    return  _box.values.map((e) => TaskModel.fromEntity(e)).where((element) => element.description == keyword).toList().reversed.toList();
  }

  @override
  Future<void> doneTask() async {
    var data = _box.values.map((e) => TaskModel.fromEntity(e)).where((element) => element.title == 'gggg').toList().reversed.toList();
    print(_box.keys.toList().where((element) => element == 16));

  }





}