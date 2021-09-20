import 'package:flutter/material.dart';

import 'featured_heading.dart';
import 'featured_tiles.dart';
import 'floating_quick_access_bar.dart';

class StackImageHeader extends StatelessWidget {
  final Size screenSize;
  final bool isFloating;
  final bool isFeaturedHeading;
  const StackImageHeader({Key? key, required this.screenSize, this.isFloating = true, this.isFeaturedHeading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: SizedBox(
            height: screenSize.height * 0.45,
            width: screenSize.width,
            child: Image.asset(
              'assets/images/bannerfundo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            if(isFloating)
            FloatingQuickAccessBar(screenSize: screenSize),
            if(isFeaturedHeading)
            Container(
              child: Column(
                children: [
                  FeaturedHeading(
                    screenSize: screenSize,
                  ),
                  FeaturedTiles(screenSize: screenSize)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
