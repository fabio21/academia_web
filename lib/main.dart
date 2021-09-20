import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'config/application.dart';
import 'config/routes.dart';
import 'utils/theme_data.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academia Galpão 21',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      //initialRoute: '/',
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}


