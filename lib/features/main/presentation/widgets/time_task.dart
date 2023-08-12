import 'package:flutter/material.dart';
class TimeTask extends StatelessWidget {
  TimeTask({
    super.key,
    required this.themeData,
    required this.onTab,
    this.title = '',
    required this.isSelected
  });

  final ThemeData themeData;
  final Function() onTab;
  String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(16),
            color: isSelected ? Colors.blue : null
        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 16,top: 4,right: 16,bottom: 4),
          child: Text(title,style: themeData.textTheme.labelLarge!.copyWith(color: isSelected ? Colors.white : Colors.black),),
        ),
      ),
    );
  }
}