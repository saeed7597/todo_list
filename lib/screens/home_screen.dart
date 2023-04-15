import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/cofig/current_dat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final appLanguage = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body:Column(
        children: [
          SizedBox(
            height: height * 0.5,
            child: Stack(
              children: [
                Positioned(
                  right: -100,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff646FD4),
                              Color(0xCF646FD4).withOpacity(0.55),
                              Color(0x00646FD4),
                            ]
                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Positioned(
                    left: -93,
                    top: -70,
                    child: Container(
                      width: width ,
                      height: 290,
                      decoration: BoxDecoration(
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
                              )
                            ],
                          )
                        )
                    )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
