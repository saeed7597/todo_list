import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/cofig/current_date.dart';
import 'package:todo_list/features/main/presentation/bloc/get_tasks_bloc.dart';

import 'package:todo_list/features/main/presentation/screens/task_list_screen.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/task_entity.dart';
import '../widgets/main_task.dart';
import '../widgets/time_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeTaskList timeTaskList = TimeTaskList.today;
  TypeTask typeTask = TypeTask.school;
  LevelTask levelTask = LevelTask.low;
  bool newTask = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  // Box<TaskEntity> box = Hive.box('tasks');

  void setTimeTask(TimeTaskList timeTaskList) {
    setState(() {
      this.timeTaskList = timeTaskList;
    });
  }

  void setTypeTask(TypeTask typeTask) {
    setState(() {
      this.typeTask = typeTask;
    });
  }

  void setLevelTask(LevelTask levelTask) {
    setState(() {
      this.levelTask = levelTask;
    });
  }

  String priority = "low";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final appLanguage = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    Color getColorPriority(String priority) {
      if (priority == 'low') {
        return Colors.blue;
      }else if (priority == "normal") {
        return Colors.orange;
      }else {
        return Colors.red;
      }
    }

    List<TaskEntity> data = [];



    return BlocProvider(
        create: (context) => sl<GetTasksBloc>(),
        child: Scaffold(
            body:BlocBuilder<GetTasksBloc,GetTasksState>(
              builder: (context,state) {
                BlocProvider.of<GetTasksBloc>(context).add(GetAllTasksEvent());
                if (state is GetAllTasksSuccess) {
                  data = state.allTasks;
                }
                if (state is GetTaskBySearchSuccess) {
                  print(state.allTasks[0].title);
                }
                return Stack(
                  children: [
                    ImageFiltered(
                      imageFilter:ImageFilter.blur(sigmaX: newTask ? 3.0 : 0, sigmaY: newTask ? 3.0 : 0) ,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.5,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: -125,
                                    top: -30,
                                    child: Container(
                                      width: width  ,
                                      height: height * 0.41,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                const Color(0xff646FD4),
                                                const Color(0xCF646FD4).withOpacity(0.55),
                                                const Color(0x00646FD4),
                                              ]
                                          ),
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: -90,
                                      top: -70,
                                      child: Container(
                                        width: width ,
                                        height: height * 0.4,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff646FD4)
                                          // color: Color(0xff646FD4),
                                        ),
                                      )
                                  ),
                                  Positioned(
                                      top: 10,
                                      left: 5,
                                      right: 5,
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                                          child: SizedBox(
                                              width: width,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
                                                      Text(appLanguage!.appName,style: themeData.textTheme.headlineMedium!.copyWith(color: Colors.white)),
                                                      Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.red,
                                                            shape: BoxShape.circle
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        appLanguage.labelYouHave,
                                                        style: themeData.textTheme.headlineSmall!.copyWith(color: Colors.black),
                                                      ),
                                                      Text(
                                                        ' 5 ',
                                                        style: themeData.textTheme.headlineSmall!.copyWith(color: Colors.white),
                                                      ),
                                                      Text(
                                                        appLanguage.labelTasks,
                                                        style: themeData.textTheme.headlineSmall!.copyWith(color: Colors.white),
                                                      ),
                                                      Text(
                                                        appLanguage.labelToday,
                                                        style: themeData.textTheme.headlineSmall!.copyWith(color: Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(CurrentDate.getDate().toString(),style: themeData.textTheme.labelLarge,),
                                                  const SizedBox(height: 30,),
                                                  Container(
                                                      width: width * 0.8,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                color: Colors.grey,
                                                                blurRadius: 20
                                                            )
                                                          ]
                                                      ),
                                                      child:  Center(
                                                        child: TextField(
                                                          controller: searchController,
                                                          onChanged: (value) {
                                                            context.read<GetTasksBloc>().add(GetTaskBySearchEvent(value));
                                                          },
                                                          decoration: const InputDecoration(
                                                              hintText: 'Search tasks',
                                                              prefixIcon: Icon(Icons.search),
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                  const SizedBox(height: 60,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      TimeTask(
                                                        themeData: themeData,
                                                        onTab: (){
                                                          setTimeTask(TimeTaskList.today);
                                                        },
                                                        title: 'Toady',
                                                        isSelected: timeTaskList == TimeTaskList.today,
                                                      ),
                                                      TimeTask(
                                                        themeData: themeData,
                                                        onTab: (){
                                                          setTimeTask(TimeTaskList.week);
                                                        },
                                                        title: 'Week',
                                                        isSelected: timeTaskList == TimeTaskList.week,
                                                      ),
                                                      TimeTask(
                                                        themeData: themeData,
                                                        onTab: (){
                                                          setTimeTask(TimeTaskList.month);
                                                        },
                                                        title: 'Month',
                                                        isSelected: timeTaskList == TimeTaskList.month,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 60,),
                                                ],
                                              )
                                          )
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Wrap(
                              children: [
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xff2A8899),
                                  countTask: data.where((element) => element.typeTask == TypeTask.school).toList().length,
                                  icon: Icons.school_outlined,
                                  title: 'School',
                                  onTab: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TaskListScreen(typeTask:TypeTask.school)));
                                  },
                                ),
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xff5EB0D2),
                                  countTask: data.where((element) => element.typeTask == TypeTask.work).toList().length,
                                  icon: Icons.work_outline,
                                  title: 'Work',
                                  onTab: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TaskListScreen(typeTask:TypeTask.work)));
                                  },
                                ),
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xffBE8972),
                                  countTask: data.where((element) => element.typeTask == TypeTask.shop).toList().length,
                                  icon: Icons.shopping_cart_outlined,
                                  title: 'Shop',
                                  onTab: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TaskListScreen(typeTask:TypeTask.shop)));
                                  },
                                ),
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xff646FD4),
                                  countTask: data.where((element) => element.typeTask == TypeTask.read).toList().length,
                                  icon: Icons.menu_book_outlined,
                                  title: 'Read',
                                  onTab: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TaskListScreen(typeTask:TypeTask.read)));
                                  },
                                ),
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xff83BC74),
                                  countTask: data.where((element) => element.typeTask == TypeTask.workOut).toList().length,
                                  icon: Icons.directions_run_outlined,
                                  title: 'Work Out',
                                  onTab: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TaskListScreen(typeTask:TypeTask.workOut)));
                                  },
                                ),
                                MainTask(
                                  themeData: themeData,
                                  backgroundColor: const Color(0xffffffff),
                                  countTask: 0,
                                  icon: Icons.add,
                                  title: '',
                                  borderColor: const Color(0xffD25EB0),
                                  onTab: (){
                                    setState(() {
                                      newTask = true;
                                    });
                                  },
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                        visible: newTask,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 150,
                              right: 12,
                              left: 12,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: width,
                                      child: TextField(
                                        autofocus: true,
                                        controller: titleController,
                                        decoration:  InputDecoration(
                                          contentPadding: const EdgeInsets.only(top: 4,left: 8,right: 8),
                                          hintText: 'Title',
                                          hintStyle: themeData.textTheme.labelLarge,
                                          border: InputBorder.none,
                                        ),
                                        style: themeData.textTheme.labelLarge,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width,
                                      child: TextField(
                                        controller: descriptionController,
                                        decoration: const InputDecoration(
                                          isDense:false,
                                          contentPadding: EdgeInsets.only(top: 1,left: 8,right: 8),
                                          hintText: 'Description',
                                          border: InputBorder.none,
                                        ),
                                        style: themeData.textTheme.labelLarge,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              TimeTask(
                                                  themeData: themeData,
                                                  onTab: (){
                                                    setTypeTask(TypeTask.school);
                                                  },
                                                  title: 'School',
                                                  isSelected: typeTask == TypeTask.school
                                              ),
                                              const SizedBox(width: 4,),
                                              TimeTask(
                                                  themeData: themeData,
                                                  onTab: (){
                                                    setTypeTask(TypeTask.work);
                                                  },
                                                  title: 'Work',
                                                  isSelected: typeTask == TypeTask.work
                                              ),
                                              const SizedBox(width: 4,),
                                              TimeTask(
                                                  themeData: themeData,
                                                  onTab: (){
                                                    setTypeTask(TypeTask.shop);
                                                  },
                                                  title: 'Shop',
                                                  isSelected: typeTask == TypeTask.shop
                                              ),
                                              const SizedBox(width: 4,),
                                              TimeTask(
                                                  themeData: themeData,
                                                  onTab: (){
                                                    setTypeTask(TypeTask.read);
                                                  },
                                                  title: 'Read',
                                                  isSelected: typeTask == TypeTask.read
                                              ),
                                              const SizedBox(width: 4,),
                                              TimeTask(
                                                  themeData: themeData,
                                                  onTab: (){
                                                    setTypeTask(TypeTask.workOut);
                                                  },
                                                  title: 'Work out',
                                                  isSelected: typeTask == TypeTask.workOut
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                    const SizedBox(height: 24,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Icon(Icons.calendar_today,color: Colors.green,),
                                                Text('Today',style: themeData.textTheme.labelLarge,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          GestureDetector(
                                            onTap: (){

                                            },
                                            child: Container(
                                              width: 100,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Icon(
                                                      Icons.flag,
                                                      color: getColorPriority(priority)
                                                  ),
                                                  DropdownButton<String>(
                                                    underline: SizedBox(),
                                                    value: priority,
                                                    onChanged: (value) {
                                                      if (value == 'low') {
                                                        setLevelTask(LevelTask.low);
                                                      }else if(value == 'normal') {
                                                        setLevelTask(LevelTask.normal);
                                                      }else {
                                                        setLevelTask(LevelTask.high);
                                                      }
                                                      setState(() {
                                                        priority = value!;
                                                      });
                                                    },
                                                    items: [
                                                      DropdownMenuItem<String>(
                                                        value: "low",
                                                        child: Text("Low",style: themeData.textTheme.labelLarge,),
                                                      ),
                                                      DropdownMenuItem<String>(
                                                        value: 'normal',
                                                        child: Text("Normal",style: themeData.textTheme.labelLarge,),
                                                      ),
                                                      DropdownMenuItem<String>(
                                                        value: 'high',
                                                        child: Text("High",style: themeData.textTheme.labelLarge,),
                                                      ),

                                                    ],

                                                  )
                                                ],
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8,bottom: 4),
                                      child: Center(
                                          child: GestureDetector(
                                            onTap: () async{
                                              TaskEntity task = TaskEntity(
                                                  title: titleController.text,
                                                  description: descriptionController.text,
                                                  levelTask: levelTask,
                                                  typeTask: typeTask,
                                                  currentDate: CurrentDate.dateTime,
                                                  doneTask: false
                                              );
                                              // task.id = await box.add(task);
                                              titleController.text = '';
                                              descriptionController.text = '';
                                              newTask = false;
                                              BlocProvider.of<GetTasksBloc>(context).add(AddNewTaskEvent(taskEntity: task));
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskListScreen(typeTask: typeTask)));
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff646FD4),
                                                  shape: BoxShape.circle
                                              ),
                                              child: const Icon(Icons.add,color: Colors.white,),
                                            ),
                                          )
                                      ),
                                    )


                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 130,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      newTask = false;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red
                                    ),
                                    child: const Icon(Icons.close,color: Colors.white,size: 30,),
                                  ),
                                )
                            ),
                          ],
                        )
                    )
                  ],
                );
              },
            )
        ),
    );
  }
}





enum TimeTaskList {
  today,week,month
}




