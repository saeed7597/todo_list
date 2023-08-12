import 'package:flutter/material.dart';
class MainTask extends StatelessWidget {
  const MainTask({
    super.key,
    required this.themeData,
    required this.backgroundColor,
    required this.countTask,
    required this.icon,
    this.title,
    this.borderColor = Colors.transparent,
    required this.onTab
  });

  final ThemeData themeData;
  final Color backgroundColor;
  final int countTask;
  final IconData icon;
  final String? title;
  final Color borderColor;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: onTab,
          child: Container(
              width: width *0.22,
              height: height * 0.15,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: borderColor,width: 1),
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                children: [
                  SizedBox(
                      width: 100,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 12
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '$countTask',
                                    style: themeData.textTheme.labelLarge!.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                              Center(
                                child:Column(
                                  children: [
                                    Icon(icon,color: title.toString().isNotEmpty ? Colors.white : const Color(0xffD25EB0),size: title.toString().isEmpty ? 40 : 24,),
                                    const SizedBox(height: 8,),
                                    title.toString().isNotEmpty ?  Text(title!,style: themeData.textTheme.labelLarge!.copyWith(color: Colors.white),) : const SizedBox()
                                  ],
                                ),
                              )
                            ],
                          )
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}