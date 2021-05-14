import 'package:flutter/material.dart';
import 'package:glance/components/roundedButton.dart';
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
                    child: Image.asset('assets/glance2.jpg'),
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: RoundedButton(
                    title: 'Sign in',
                    color: Colors.black,
                    onpressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
