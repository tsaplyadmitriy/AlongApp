

import 'package:deliver_inno_bot/init/navigator.dart';
import 'package:deliver_inno_bot/init/routes.dart';
import 'package:deliver_inno_bot/util/localization.dart';

import 'package:deliver_inno_bot/init/navigator.dart';
import 'package:deliver_inno_bot/init/routes.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RvmsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      title: "Allong",
      //theme: AppTheme.theme,
      localizationsDelegates: [
        RvmsLocalizationsDelegate(),
      ],
      routes: {
        Routes.home: (context) =>
            Material(child: SafeArea(child: NavigatorScreen())),
      },
    );
  }
}
