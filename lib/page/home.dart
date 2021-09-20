import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:web_site_academia/widgets/app_bar/app_bar_custom.dart';
import 'package:web_site_academia/widgets/bottom_bar.dart';
import 'package:web_site_academia/widgets/carousel.dart';
import 'package:web_site_academia/widgets/destination_heading.dart';
import 'package:web_site_academia/widgets/explore_drawer.dart';
import 'package:web_site_academia/widgets/featured_heading.dart';
import 'package:web_site_academia/widgets/featured_tiles.dart';
import 'package:web_site_academia/widgets/floating_quick_access_bar.dart';
import 'package:web_site_academia/widgets/responsive.dart';
import 'package:web_site_academia/widgets/stack_image_header.dart';
import 'package:web_site_academia/widgets/top_bar_contents.dart';
import 'package:web_site_academia/widgets/web_scrollbar.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if(mounted) {
      _scrollController = ScrollController();
      _scrollController.addListener(_scrollListener);
    }
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
      //drawer: ExploreDrawer(),
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
              StackImageHeader(screenSize: screenSize),
              DestinationHeading(screenSize: screenSize),
              DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }

}
