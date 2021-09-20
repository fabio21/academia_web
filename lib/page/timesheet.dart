import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_site_academia/model/timesheet.dart';
import 'package:web_site_academia/widgets/app_bar/app_bar_custom.dart';
import 'package:web_site_academia/widgets/bottom_bar.dart';
import 'package:web_site_academia/widgets/destination_heading.dart';
import 'package:web_site_academia/widgets/responsive.dart';
import 'package:web_site_academia/widgets/stack_image_header.dart';
import 'package:web_site_academia/widgets/web_scrollbar.dart';
import 'package:intl/intl.dart';

import '../decoration.dart';

String getDayWeek(int index) {
  switch (index) {
    case 1:
      return "Segunda";
    case 2:
      return "Terça";
    case 3:
      return "Quarta";
    case 4:
      return "Quinta";
    case 5:
      return "Sexta";
    case 6:
      return "Sabado";
    default:
      return "Domingo";
  }
}

class TimeSheet extends StatefulWidget {
  static const String timeSheet = 'timesheet';

  const TimeSheet({Key? key}) : super(key: key);

  @override
  _TimeSheetState createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  late List<TimesheetModel>? timesheetModel;

  _scrollListener() async {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  initList() async {
    await getJsonMock();
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    timesheetModel = null;
    initList();
    super.initState();

    // timesheetModel = [
    //   TimesheetModel(
    //       instructor: "Claudirene",
    //       livingRoom: "0",
    //       schedule: DateTime.parse("2019-07-19T06:00:00.000000Z"),
    //       type: "Natação",
    //       week: 1),
    //   TimesheetModel(
    //       instructor: "Claudirene",
    //       livingRoom: "0",
    //       schedule: DateTime.parse("2019-07-19T07:00:00.000000Z"),
    //       type: "Natação",
    //       week: 2),
    //   TimesheetModel(
    //     instructor: "Roberto",
    //     livingRoom: "0",
    //     schedule: DateTime.parse("2019-07-19T09:00:00.000000Z"),
    //     type: "Hidroginastica",
    //     week: 3,
    //   ),
    //   TimesheetModel(
    //     instructor: "Marcos",
    //     livingRoom: "1",
    //     schedule: DateTime.parse("2019-07-19T09:00:00.000000Z"),
    //     type: "Ginastica",
    //     week: 1,
    //   ),
    //   TimesheetModel(
    //     instructor: "Marcos",
    //     livingRoom: "2",
    //     schedule: DateTime.parse("2019-07-19T16:00:00.000000Z"),
    //     type: "Ginastica",
    //     week: 1,
    //   ),
    //   TimesheetModel(
    //     instructor: "Aline",
    //     livingRoom: "2",
    //     schedule: DateTime.parse("2019-07-19T20:00:00.000000Z"),
    //     type: "Ginastica",
    //     week: 5,
    //   )
    // ];
    // timesheetModel.sort((a, b) => a.schedule!.compareTo(b.schedule!));
    // timesheetModel.sort((a, b) => a.week!.compareTo(b.week!));
  }

  Future<void> getJsonMock() async {
    final jsonString =
        await DefaultAssetBundle.of(context).loadString('list_horarios.json');
    final dynamic jsonMap = jsonDecode(jsonString);
    final list = jsonMap
        .map((json) => TimesheetModel.fromJson(json))
        .cast<TimesheetModel>()
        .toList();
    timesheetModel = list;
    if (timesheetModel != null) {
      timesheetModel!.sort((a, b) => a.week!.compareTo(b.week!));
      timesheetModel!.sort((a, b) => a.schedule!.compareTo(b.schedule!));
    }

    return Future.value();
  }

  String formatHour(DateTime srtDate) {
    return DateFormat.Hm().format(srtDate);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? buildAppBarMoble(context, _opacity)
          : buildPreferredSizeWeb(screenSize, _opacity),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              StackImageHeader(screenSize: screenSize, isFloating: false),
              DestinationHeading(
                screenSize: screenSize,
                title: "Quadro de horarios Aulas",
              ),
              buildTimesheet(screenSize),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimesheet(Size screenSize) {
    return AspectRatio(
      aspectRatio: 2 / 6,
      child: Center(
        heightFactor: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: screenSize.height / 50,
                bottom: screenSize.height / 50,
              ),
              child: timesheetModel != null
                  ? getTimeWebProgram()
                  : CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCards(TimesheetModel model) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Theme.of(context).dividerColor))),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            //text: "${getDayWeek(model.week ?? 0)}\n",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
            children: [
              lineTitleSubTitle(
                  subTitle: model.type!, theme: TextStyle(fontSize: 20)),
              lineTitleSubTitle(
                  title: "Instrutor: ", subTitle: model.instructor!),
              lineTitleSubTitle(
                  title: "Horario: ", subTitle: formatHour(model.schedule!)),
              if (model.livingRoom != "0")
                lineTitleSubTitle(title: "Sala: ", subTitle: model.livingRoom!)
            ],
          ),
        ),
      ),
    );
  }

  TextSpan lineTitleSubTitle(
      {String? title, required String subTitle, TextStyle? theme}) {
    theme = theme != null ? theme : Theme.of(context).textTheme.subtitle1;
    return TextSpan(
      text: title ?? "",
      style: Theme.of(context).textTheme.subtitle2,
      children: [
        TextSpan(
          text: "$subTitle\n",
          style: theme,
        ),
      ],
    );
  }

  Widget getTimeWebProgram() {
    return Row(
      children: [
        boxWeekDay(getListWeekDayHour("Segunda", 1)),
        boxWeekDay(getListWeekDayHour("Terça", 2)),
        boxWeekDay(getListWeekDayHour("Quarta", 3)),
        boxWeekDay(getListWeekDayHour("Quinta", 4)),
        boxWeekDay(getListWeekDayHour("Sexta", 5)),
        boxWeekDay(getListWeekDayHour("Sabado", 6), isLast: true),
      ],
    );
  }

  List<Widget> getListWeekDayHour(String title, int week) {
    List<Widget> s = [
      Container(
          height: 40,
          child: Text(
            title,
            style: TextStyle(fontSize: 24),
          )),
    ];
    var sl = timesheetModel!.where((element) => element.week == week).toList();
    s.addAll(sl.map((e) => getCards(e)).toList());
    return s;
  }

  Widget boxWeekDay(List<Widget> list, {bool isLast = false}) {
    var color = Theme.of(context).dividerColor;
    Border border = borderLInes(isLast, color);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: border,
        ),
        child: Column(children: list),
      ),
    );
  }

  Border borderLInes(bool isLast, Color color) {
    return isLast
        ? Border(
            left: BorderSide(color: color),
            top: BorderSide(color: color),
            right: BorderSide(color: color),
            bottom: BorderSide(color: color))
        : Border(
            left: BorderSide(color: color),
            top: BorderSide(color: color),
            bottom: BorderSide(color: color));
  }
}
