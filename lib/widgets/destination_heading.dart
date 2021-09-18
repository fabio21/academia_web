import 'package:web_site_academia/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? buildContainer()
        : buildContainer(top: 10, bottom: 15, fontSize: 40);
  }

  Container buildContainer(
      {double top = 20, double bottom = 20, double fontSize = 24}) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / top,
        bottom: screenSize.height / bottom,
      ),
      width: screenSize.width,
      // color: Colors.black,
      child: buildTextHeader(),
    );
  }

  Text buildTextHeader({double fontSize = 24}) {
    return Text(
      'Modalidades',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
