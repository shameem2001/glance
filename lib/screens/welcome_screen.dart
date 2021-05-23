import 'package:flutter/material.dart';
import 'package:glance/components/roundedButton.dart';
import 'package:glance/screens/enter_details_screen.dart';
import 'package:glance/screens/home_page.dart';
import 'package:glance/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('assets/app_icon.png'),
                    height: 200,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                      title: 'LOG IN',
                      color: Colors.black,
                      onpressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      }),
                  RoundedButton(
                      title: 'REGISTER',
                      color: Colors.black,
                      onpressed: () {
                        Navigator.pushReplacementNamed(context, EnterDetailsScreen.id);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
