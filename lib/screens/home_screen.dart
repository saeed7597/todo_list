import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/cofig/current_dat.dart';

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
  LevelTask levelTask = LevelTask.normal;
  bool newTask = false;

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
  
  
  String priority = "Low";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final appLanguage = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    Color getColorPriority(String priority) {
      if (priority == 'Low') {
        return Colors.blue;
      }else if (priority == "Normal") {
        return Colors.orange;
      }else {
        return Colors.red;
      }
    }

    return Scaffold(
      body:Stack(
        children: [
          ImageFiltered(
            enabled: newTask,
            imageFilter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
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
                                        Text(CurrentDate.getDate(),style: themeData.textTheme.labelLarge,),
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
                                            child: const Center(
                                              child: TextField(
                                                decoration: InputDecoration(
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
                        countTask: 5,
                        icon: Icons.school_outlined,
                        title: 'School',
                        onTab: (){

                        },
                      ),
                      MainTask(
                        themeData: themeData,
                        backgroundColor: const Color(0xff5EB0D2),
                        countTask: 5,
                        icon: Icons.work_outline,
                        title: 'Work',
                        onTab: (){},
                      ),
                      MainTask(
                        themeData: themeData,
                        backgroundColor: const Color(0xffBE8972),
                        countTask: 5,
                        icon: Icons.shopping_cart_outlined,
                        title: 'Shop',
                        onTab: (){},
                      ),
                      MainTask(
                        themeData: themeData,
                        backgroundColor: const Color(0xff646FD4),
                        countTask: 5,
                        icon: Icons.menu_book_outlined,
                        title: 'Read',
                        onTab: (){},
                      ),
                      MainTask(
                        themeData: themeData,
                        backgroundColor: const Color(0xff83BC74),
                        countTask: 5,
                        icon: Icons.directions_run_outlined,
                        title: 'Work Out',
                        onTab: (){},
                      ),
                      MainTask(
                        themeData: themeData,
                        backgroundColor: const Color(0xffffffff),
                        countTask: 5,
                        icon: Icons.add,
                        title: '',
                        borderColor: const Color(0xffD25EB0),
                        onTab: (){
                          setState(() {
                            newTask= true;
                          });
                        },
                      ),

                    ],
                  ),
                ],
              ),
            )
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
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 4,left: 8,right: 8),
                                hintText: 'Title',
                                border: InputBorder.none,
                              ),
                              style: themeData.textTheme.labelLarge,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: TextField(
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
                                      Icon(Icons.calendar_today,color: Colors.green,),
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
                                            setState(() {
                                              priority = value!;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "Low",
                                              child: Text("Low",style: themeData.textTheme.labelLarge,),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Normal',
                                              child: Text("Normal",style: themeData.textTheme.labelLarge,),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'High',
                                              child: Text("High",style: themeData.textTheme.labelLarge,),
                                            ),

                                          ],

                                        )
                                      ],
                                    ),
                                  ),
                                ),



                                // TaskLevelItem(
                                //   themeData: themeData,
                                //   color: Colors.red,
                                //   title: 'High',
                                //   isSelected: levelTask == LevelTask.high,
                                //   onTab: (){setLevelTask(LevelTask.high);},
                                // ),
                                // TaskLevelItem(
                                //   themeData: themeData,
                                //   color: Colors.orange,
                                //   title: 'Normal',
                                //   isSelected: levelTask == LevelTask.normal,
                                //   onTab: (){setLevelTask(LevelTask.normal);},
                                // ),
                                // TaskLevelItem(
                                //   themeData: themeData,
                                //   color: Colors.blue,
                                //   title: 'Low',
                                //   isSelected: levelTask == LevelTask.low,
                                //   onTab: (){setLevelTask(LevelTask.low);},
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8,bottom: 4),
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color(0xff646FD4),
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
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
      ),
    );
  }
}

class TaskLevelItem extends StatelessWidget {
  const TaskLevelItem({
    super.key,
    required this.themeData,
    required this.color,
    required this.title,
    required this.isSelected,
    required this.onTab
  });

  final ThemeData themeData;
  final String title;
  final bool isSelected;
  final Color color;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Row(
              children: [
                Text(title,style: themeData.textTheme.labelLarge!.copyWith(color: Colors.white),),
                const SizedBox(width: 4,),
                isSelected ?
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child:Icon(Icons.check,color: Colors.green,size: 14,),
                ) : const SizedBox()
              ],
            ),
          )
      ),
    );
  }
}




enum TimeTaskList {
  today,week,month
}

enum TypeTask {
  school,work,shop,read,workOut
}

enum LevelTask {
  high,normal,low
}
