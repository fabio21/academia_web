import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String? link1;
  final String s2;
  final String? link2;
  final String s3;
  final String? link3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3, this.link1, this.link2, this.link3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(
            title: heading,
            fontSize: 18,
            color: Colors.blueGrey.shade300,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10),
          buildText(title: s1, link: link1),
          SizedBox(height: 5),
          buildText(title: s2, link: link2),
          SizedBox(height: 5),
          buildText(title: s3, link: link3),
        ],
      ),
    );
  }

  Widget buildText({required String title,
    double fontSize = 14,
    Color? color,
    String? link,
    FontWeight? fontWeight}) {
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
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
