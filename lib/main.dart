import 'package:flutter/material.dart';
import 'package:glance/home_page.dart';
import 'package:glance/login_screen.dart';
import 'package:glance/register_screen.dart';
import 'package:glance/splash_screen.dart';
import 'package:glance/welcome_screen.dart';

void main() {
  runApp(Glance());
}
class Glance extends StatelessWidget {
  const Glance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
