import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    hintText: 'Enter your email',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              const SizedBox(height: 24,),
              TextField(
                decoration: InputDecoration(
                    hintText: 'password',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)
                    ),
                    suffixIcon: InkWell(onTap: (){},child: const Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),)
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
                    width: 50,
                    height: 1,
                    decoration: const BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(width: 3,),
                  Text(' Or Continue With'),
                  SizedBox(width: 3,),
                  Container(
                    width: 50,
                    height: 1,
                    decoration: const BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
      )
    );
  }
}
