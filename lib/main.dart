import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/core/services/service_locator.dart';
import 'package:todo_list/screens/one_screen.dart';

import 'cofig/app_theme_config.dart';
import 'features/main/domain/entities/task_entity.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  Hive.registerAdapter(LevelTaskAdapter());
  Hive.registerAdapter(TypeTaskAdapter());
  await Hive.openBox('tasks');
  ServiceLocator.init();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:  Color(0xff646FD4),
      )
  );
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const themeMode = ThemeMode.light;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates:  const[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English// Spanish
        ],
        theme: themeMode == ThemeMode.light
                ? AppThemeConfig.light().getTheme()
                : AppThemeConfig.dark().getTheme(),
        home: const OneScreen());
  }
}




