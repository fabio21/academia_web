import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:web_site_academia/page/home.dart';
import 'package:web_site_academia/utils/authentication.dart';
import 'package:web_site_academia/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme
            .of(context)
            .bottomAppBarColor
            .withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: buildText()),
              // Expanded(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(width: screenSize.width / 8),
              //       buildInkWell('Discover', 0),
              //       SizedBox(width: screenSize.width / 20),
              //       buildInkWell('Contact Us', 1)
              //     ],
              //   ),
              // ),
              IconButton(
                icon: Icon(Icons.brightness_6),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.white,
                onPressed: () {
                  EasyDynamicTheme.of(context).changeTheme();
                },
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
             // buildInkWellLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  buildInkWellLogin(BuildContext context) {
    return InkWell(
      onHover: (value) => onHover(value, index: 3),
      onTap: () => onTapAuth(context),
      child:
      userEmail == null
          ? buildTextSignIn()
          :
      Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage:
            imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Icon(
              Icons.account_circle,
              size: 30,
            )
                : Container(),
          ),
          SizedBox(width: 5),
          Text(
            name ?? userEmail!,
            style: TextStyle(
              color: _isHovering[3] ? Colors.white : Colors.white70,
            ),
          ),
          SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () => onPressed(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: _isProcessing
                  ? CircularProgressIndicator()
                  : Text(
                'Sign out',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPressed(BuildContext context) async {
    if (!_isProcessing) {
      setState(() {
        _isProcessing = true;
      });
      await signOut().then((result) {
        print(result);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => HomePage(),
          ),
        );
      }).catchError((error) {
        print('Sign Out Error: $error');
      });
      setState(() {
        _isProcessing = false;
      });
    }
  }

Text buildTextSignIn() {
  return Text(
    'Sign in',
    style: TextStyle(
      color: _isHovering[3] ? Colors.white : Colors.white70,
    ),
  );
}

void onTapAuth(BuildContext context) {
  if (userEmail == null)
    showDialog(
      context: context,
      builder: (context) => AuthDialog(),
    );
}

InkWell buildInkWell(String title, int index) {
  return InkWell(
    onHover: (value) => onHover(value, index: index),
    onTap: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: _isHovering[index] ? Colors.blue[200] : Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: _isHovering[index],
          child: Container(
            height: 2,
            width: 20,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

void onHover(value, {int index = 0}) {
  setState(() {
    value ? _isHovering[index] = true : _isHovering[index] = false;
  });
}

Text buildText() {
  return Text(
    'Academia Galpao 21',
    style: TextStyle(
      color: Colors.blueGrey[100],
      fontSize: 20,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      letterSpacing: 3,
    ),
  );
}}
