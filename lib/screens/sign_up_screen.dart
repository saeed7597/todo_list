
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool showPassword = false;
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final appLanguage = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 150,),
              Center(child: Text(
                appLanguage!.labelHello,
                style: themeData.textTheme.headlineMedium,
              ),),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appLanguage.labelWelcome,style: themeData.textTheme.labelMedium!.apply(color: Colors.grey),),
                    Text(appLanguage.appName,style: themeData.textTheme.labelMedium!.apply(color: Colors.grey),)
                  ],
                ),
              ),
              Center(
                child: Text(appLanguage.labelSignUpTo,style: themeData.textTheme.labelMedium!.copyWith(color: Colors.grey),),
              ),
              const SizedBox(height: 12,),
              TextField(
                decoration: InputDecoration(
                    hintText: appLanguage.hintYourName,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                decoration: InputDecoration(
                    hintText: appLanguage.hintYourEmail,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              const SizedBox(height: 8,),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                    hintText: appLanguage.hintPassword,
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
              const SizedBox(height: 64,),
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
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: Text(appLanguage.labelSignUp)
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLanguage.labelAlreadyAccount,style: themeData.textTheme.labelMedium!.copyWith(color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    },
                    child: Text(
                      appLanguage.labelLogIn,
                      style: themeData.textTheme.labelMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        color: const Color(0xff646FD4),
                      ),
                    ),
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
