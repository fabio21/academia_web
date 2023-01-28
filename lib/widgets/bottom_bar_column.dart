import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_site_academia/widgets/responsive.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final IconData? icon1;
  final String? link1;
  final String? s2;
  final IconData? icon2;
  final String? link2;
  final String? s3;
  final IconData? icon3;
  final String? link3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    this.s2,
    this.s3,
    this.link1,
    this.link2,
    this.link3,
    this.icon1,
    this.icon2,
    this.icon3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: ResponsiveWidget.isSmallScreen(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        buildText(
          title: heading,
          fontSize: 18,
          color: Colors.blueGrey.shade300,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 10),
        iconRow(buildText(title: s1, link: link1), icon1, context),
        if (s2 != null) SizedBox(height: 5),
        if (s2 != null) iconRow(buildText(title: s2!, link: link2), icon2, context),
        if (s3 != null) SizedBox(height: 5),
        if (s3 != null) iconRow(buildText(title: s3!, link: link3), icon3, context),
      ],
    );
  }

  Widget iconRow(Widget child, IconData? icon, context) {
    return icon != null
        ? Row(
      mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(icon),
              ),
              child
            ],
          )
        : child;
  }

  Widget buildText({
    required String title,
    double fontSize = 14,
    Color? color,
    String? link,
    FontWeight? fontWeight,
  }) {
    return GestureDetector(
      onTap: link != null ? () => linkGet(link) : null,
      child: Text(
        title,
        style: TextStyle(
          color: color == null ? Colors.blueGrey.shade100 : color,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  linkGet(String url) async {
    if(url.isNotEmpty){
      canLaunchUrl(Uri.parse(url));
    }
  }
}
