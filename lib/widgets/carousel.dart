import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_site_academia/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  @override
  void dispose() {
    super.dispose();
  }

  final List<String> images = [
    'assets/images/natacao.jpeg',
    'assets/images/picina.jpg',
    'assets/images/musck.jpg',
    'assets/images/ginastica.jpeg',
    'assets/images/jui.jpeg',
    'assets/images/ballet.jpeg',
  ];

  final List<String> places = [
    'NATAÇÃO',
    'HIDROGINASTICA',
    'MUSCULAÇÃO',
    'GINASTICA',
    'JIU-JITSU',
    'BALLET',
  ];

  List<Widget> generateImageTiles(screenSize)  {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.fill,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Stack(
      children: [
        buildCarouselSlider(imageSliders, context),
        buildAspectRatioPlaces(screenSize),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : buildAspectRatioWeb(screenSize, context),
      ],
    );
  }

  AspectRatio buildAspectRatioWeb(Size screenSize, BuildContext context) {
    return AspectRatio(
      aspectRatio: 17 / 8,
      child: Center(
        heightFactor: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: screenSize.width / 8,
              right: screenSize.width / 8,
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height / 50,
                  bottom: screenSize.height / 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < places.length; i++)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onHover: (value) => onHover(value, i),
                            onTap: () {
                              _controller.animateToPage(i);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: screenSize.height / 80,
                                  bottom: screenSize.height / 90),
                              child: Text(
                                places[i],
                                style: TextStyle(
                                  color: _isHovering[i]
                                      ? Theme.of(context)
                                          .primaryTextTheme
                                          .labelLarge!
                                          .decorationColor
                                      : Theme.of(context)
                                          .primaryTextTheme
                                          .labelLarge!
                                          .color,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: _isSelected[i],
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 400),
                              opacity: _isSelected[i] ? 1 : 0,
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                width: screenSize.width / 10,
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AspectRatio buildAspectRatioPlaces(Size screenSize) {
    return AspectRatio(
      aspectRatio: 18 / 8,
      child: Center(
        child: Text(
          places[_current],
          style: TextStyle(
            letterSpacing: 8,
            fontFamily: 'Electrolize',
            fontWeight: FontWeight.w800,
            fontSize: screenSize.width / 25,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  CarouselSlider buildCarouselSlider(
      List<Widget> imageSliders, BuildContext context) {
    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
        scrollPhysics: ResponsiveWidget.isSmallScreen(context)
            ? PageScrollPhysics()
            : NeverScrollableScrollPhysics(),
        enlargeCenterPage: true,
        aspectRatio: 18 / 8,
        autoPlay: true,
        onPageChanged: (index, reason) =>
            onPageChanged(index, reason, imageSliders),
      ),
      carouselController: _controller,
    );
  }

  void onPageChanged(index, reason, imageSliders) {
    setState(() {
      _current = index;
      for (int i = 0; i < imageSliders.length; i++) {
        if (i == index) {
          _isSelected[i] = true;
        } else {
          _isSelected[i] = false;
        }
      }
    });
  }

  onHover(value, int i) {
    setState(() {
      value ? _isHovering[i] = true : _isHovering[i] = false;
    });
  }
}
