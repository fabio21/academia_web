import 'package:web_site_academia/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? buildColumnMobile(context)
          : buildRowWeb(context),
    );
  }

  Row buildRowWeb(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTextHeader(fontSize: 40),
        Expanded(
          child: buildTextFrase(context),
        ),
      ],
    );
  }

  Column buildColumnMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(),
        buildTextHeader(),
        SizedBox(height: 5),
        buildTextFrase(context),
        SizedBox(height: 10),
      ],
    );
  }

  Text buildTextFrase(BuildContext context) {
    return Text(
      'Uma vida sustentável contribui para a saúde',
      textAlign: TextAlign.end,
      style: Theme.of(context).primaryTextTheme.titleMedium,
    );
  }

  Text buildTextHeader({double fontSize = 24}) {
    return Text(
      'Evolução',
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
