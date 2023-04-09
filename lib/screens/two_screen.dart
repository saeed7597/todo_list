import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/screens/login_screen.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLanguage = AppLocalizations.of(context);
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/mobile-login-pana.svg',
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Text(
            appLanguage!.labelStart,
            style: themeData.textTheme.headline6,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLanguage.appName,
            style: themeData.textTheme.headline6!.copyWith(
              color: const Color(0xff9BA3EB),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 43,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        themeData.secondaryHeaderColor),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: Text(appLanguage.labelSignUp)),
            ),
          ),
          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(appLanguage.labelHaveAnAccount,style: themeData.textTheme.caption!.copyWith(fontSize: 13),),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                },
                child: Text(appLanguage.labelLogIn,style: const TextStyle(decoration: TextDecoration.underline),),
              )
            ],
          )
        ],
      ),
    );
  }
}
