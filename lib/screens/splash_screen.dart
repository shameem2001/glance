import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glance/screens/home_page.dart';
import 'package:glance/screens/welcome_screen.dart';
import 'package:glance/utils/authentication.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var duration = Duration(
      seconds: 3,
    );
    Timer(duration, () async {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      if(sharedPreferences.get("isSignedIn") == null)
        sharedPreferences.setBool("isSignedIn", false);
      if (sharedPreferences.get("isSignedIn"))
        Authentication.initializeFirebase(context: context);
      else
        Navigator.pushReplacementNamed(context, WelcomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'assets/app_icon.png',
                              scale: 4,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text(
                            'Glance',
                            style: GoogleFonts.openSans(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.5),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
