import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/screens/sign_up_screen.dart';
import 'package:todo_list/widgets/button_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final appLanguage = AppLocalizations.of(context);
    final themeData = Theme.of(context);


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 160,),
              Center(
                child: Text(
                  appLanguage!.labelHelloAgain,
                  style: themeData.textTheme.headline6,
                ),
              ),
              const SizedBox(height: 5,),
              Center(
                child: Text(appLanguage.labelWelcomeBack,style: themeData.textTheme.bodyText1,),
              ),
              const SizedBox(height: 24,),
              TextField(
                decoration: InputDecoration(
                    hintText: appLanguage.hintInputEmail,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              const SizedBox(height: 24,),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                    hintText: appLanguage.hintInputPassword,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    ),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(Icons.remove_red_eye_outlined,color: showPassword ? Colors.blue : Colors.grey,),
                    )
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff646FD4)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                      )
                    ),
                    onPressed: (){},
                    child: Text(appLanguage.labelLogIn)
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 1,
                    decoration: const BoxDecoration(

                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white,
                              Colors.grey
                            ]
                        )
                    ),
                  ),
                  const SizedBox(width: 3,),
                  Text(appLanguage.labelOtherAccount,style: themeData.textTheme.caption,),
                  const SizedBox(width: 3,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 1,
                    decoration:const   BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white,
                              Colors.grey
                            ]
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonLogin(
                      borderColor: Colors.grey,
                      background: Colors.white,
                      nameAccount: appLanguage.labelGoogle,
                      pathIcon: 'assets/svg/google.svg',
                      textStyle: themeData.textTheme.bodyText1!.copyWith(color: Colors.grey),
                  ),
                  ButtonLogin(
                      borderColor: const Color(0xff4267B2),
                      background: const Color(0xff4267B2),
                      nameAccount: appLanguage.labelFacebook,
                      pathIcon: 'assets/svg/facebook.svg',
                      textStyle: themeData.textTheme.bodyText1!.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLanguage.labelNotMember,style: themeData.textTheme.bodyText1!.copyWith(color:Colors.grey),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    child: Text(appLanguage.labelRegisterNow,style: themeData.textTheme.bodyText1,),
                  )
                ],
              )

            ],
          ),
        )
      )
    );
  }
}
