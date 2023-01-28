import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import '../top_bar_contents.dart';

PreferredSize buildPreferredSizeWeb(Size screenSize,double opacity) {
  return PreferredSize(
    preferredSize: Size(screenSize.width, 1000),
    child: TopBarContents(opacity),
  );
}

AppBar buildAppBarMoble(BuildContext context, double opacity) {
  return AppBar(
    backgroundColor:
    Theme.of(context).bottomAppBarTheme.color?.withOpacity(opacity),
    elevation: 0,
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.brightness_6),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          EasyDynamicTheme.of(context).changeTheme();
        },
      ),
    ],
    title: Text(
      'Academia Galpão 21',
      style: TextStyle(
        color: Colors.blueGrey[100],
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
      ),
    ),
  );
}