import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  InfoText({required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText('$type: '),
        Flexible(
          child: buildText(text, color: Colors.blueGrey.shade100),
        )
      ],
    );
  }

  Text buildText(String title, {Color? color}) {
    return Text(
      title,
      style: TextStyle(
        color: color == null ? Colors.blueGrey.shade300 : color,
        fontSize: 16,
      ),
    );
  }
}
