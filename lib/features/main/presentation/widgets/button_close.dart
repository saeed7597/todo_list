import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {

  const ButtonClose({Key? key,required this.newTask,required this.onTap}):super(key: key);
  final bool newTask;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red
        ),
        child: const Icon(Icons.close,color: Colors.white,size: 30,),
      ),
    );
  }

}

