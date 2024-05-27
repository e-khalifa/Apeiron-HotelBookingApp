import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_transitions/route_transitions.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showButton = false; // Initially hidden

  @override
  void initState() {
    super.initState();
    // Show the explore button after the slogan is shown
    Future.delayed(Duration(milliseconds: 1550), () {
      setState(() {
        showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sss.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0, right: 20.0),

          //button fading in
          child: AnimatedOpacity(
            opacity: showButton ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: ElevatedButton(
              onPressed: () {
                slideRightWidget(newPage: HomePage(), context: context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 5,
                side: BorderSide(
                  width: 0.2,
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, //Only take the size of its contents
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'AnticDidone',
                    ),
                  ),
                  SizedBox(width: 30),
                  Icon(Icons.arrow_circle_right_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
