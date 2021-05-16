import 'package:flutter/material.dart';
import 'package:glance/screens/bill_calculator_screen.dart';
import 'package:glance/screens/enter_details_screen.dart';
import 'package:glance/screens/home_page.dart';
import 'package:glance/screens/login_screen.dart';
import 'package:glance/screens/notification_screen.dart';
import 'package:glance/screens/payments_screen.dart';
import 'package:glance/screens/profile_screen.dart';
import 'package:glance/screens/register_screen.dart';
import 'package:glance/screens/splash_screen.dart';
import 'package:glance/screens/welcome_screen.dart';


void main() {
  runApp(Glance());
}
class Glance extends StatelessWidget {
  const Glance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        EnterDetailsScreen.id: (context) => EnterDetailsScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomePage.id: (context) => HomePage(),
        ProfileScreen.id: (context) => ProfileScreen(),
        PaymentsScreen.id: (context) => PaymentsScreen(),
        BillCalculatorScreen.id: (context) => BillCalculatorScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
