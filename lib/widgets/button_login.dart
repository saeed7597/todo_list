import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    required this.borderColor,
    required this.background,
    required this.nameAccount,
    required this.pathIcon,
    required this.textStyle,
    Key? key}) : super(key: key);

  final Color background;
  final Color borderColor;
  final String pathIcon;
  final String nameAccount;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 48,
      decoration: BoxDecoration(
          color: background,
          border:Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          const SizedBox(width: 16,),
          SvgPicture.asset(pathIcon),
          const SizedBox(width: 8,),
          Text(nameAccount,style: textStyle,),
        ],
      ),
    );
  }
}
