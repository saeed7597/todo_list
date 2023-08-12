import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'task_entity.g.dart';
@HiveType(typeId: 0)

class TaskEntity extends Equatable {
  @HiveField(1)
  String title ='';
  @HiveField(2)
  String description = '';
  @HiveField(3)
  LevelTask levelTask = LevelTask.low;
  @HiveField(4)
  TypeTask typeTask = TypeTask.school;
  @HiveField(5)
  DateTime currentDate = DateTime.now();
  @HiveField(6)
  bool doneTask = false;


  TaskEntity(
      {required this.title,
      required this.description,
      required this.levelTask,
      required this.typeTask,
      required this.currentDate,
      required this.doneTask});

  @override
  List<Object?> get props => [title,description,levelTask,typeTask,currentDate,doneTask];
}
@HiveType(typeId: 1)
enum LevelTask {
  @HiveField(0)
  high,
  @HiveField(1)
  normal,
  @HiveField(2)
  low
}
@HiveType(typeId: 2)
enum TypeTask {
  @HiveField(0)
  school,
  @HiveField(1)
  work,
  @HiveField(2)
  shop,
  @HiveField(3)
  read,
  @HiveField(4)
  workOut
}