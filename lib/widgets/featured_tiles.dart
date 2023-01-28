import 'package:web_site_academia/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/exercicios.jpeg',
    'assets/images/saude.jpeg',
    'assets/images/lazer.jpeg',
  ];

  final List<String> title = ['Exercicios', 'Saude', 'Lazer'];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? buildPaddingMobile(context)
        : buildPaddingWeb(context);
  }

  Padding buildPaddingWeb(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...Iterable<int>.generate(assets.length).map(
            (int pageIndex) => Column(
              children: [
                buildSizedBox(pageIndex, height: 6, width: 3.8),
                buildPaddingText(pageIndex, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPaddingMobile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height / 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: screenSize.width / 15),
            ...Iterable<int>.generate(assets.length).map(
              (int pageIndex) => Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSizedBox(pageIndex),
                      buildPaddingText(pageIndex, context),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(int pageIndex,
      {double height = 2.5, double width = 1.5}) {
    return SizedBox(
      height: screenSize.width / height,
      width: screenSize.width / width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          assets[pageIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding buildPaddingText(int pageIndex, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height / 70,
      ),
      child: buildText(pageIndex, context),
    );
  }

  Text buildText(int pageIndex, BuildContext context) {
    return Text(
      title[pageIndex],
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryTextTheme.titleMedium!.color,
      ),
    );
  }
}
