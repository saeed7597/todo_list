import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/two_screen.dart';
class OneScreen extends StatelessWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final appLanguage = AppLocalizations.of(context);
    return Scaffold(
        body: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/Completed-rafiki.svg',
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.manageTasks,
                    style: themData.textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 51),
                    child: Text(
                      AppLocalizations.of(context)!.labelDescription,
                      style: themData.textTheme.caption,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: SizedBox(
                      width: width,
                      height: 43,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                themData.secondaryHeaderColor),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeScreen()));
                          },
                          child: Text(appLanguage!.labelButtonGetStarted)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}