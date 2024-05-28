import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showButton = false; // explore button initially hidden

  @override
  void initState() {
    super.initState();
    // Show the button after the slogan
    Future.delayed(Duration(milliseconds: 900), () {
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
          image: AssetImage('assets/images/splashScreen.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0, right: 20.0),
          //button fading in
          child: AnimatedOpacity(
            opacity: showButton ? 1.0 : 0.0,
            duration: Duration(milliseconds: 700),
            child: ElevatedButton(
              onPressed: () {
                slideRightWidget(newPage: HomePage(), context: context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 10, right: 5),
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
                  SizedBox(width: 70),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
