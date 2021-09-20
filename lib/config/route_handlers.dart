import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:web_site_academia/page/home.dart';
import 'package:web_site_academia/page/timesheet.dart';

var rootHandlerHome = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return HomePage();
    });

var rootHandlerTimeSheet = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return TimeSheet();
    });