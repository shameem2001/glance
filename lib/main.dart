import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glance/screens/bill_history_screen.dart';
import 'package:glance/screens/bill_payment_second_screen.dart';
import 'package:glance/screens/enter_details_screen.dart';
import 'package:glance/screens/home_page.dart';
import 'package:glance/screens/login_screen.dart';
import 'package:glance/screens/notification_screen.dart';
import 'package:glance/screens/payments_screen.dart';
import 'package:glance/screens/profile_screen.dart';
import 'package:glance/screens/register_screen.dart';
import 'package:glance/screens/splash_screen.dart';
import 'package:glance/screens/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Glance());
}

class Glance extends StatelessWidget {
  const Glance({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => DoubleBack(
              message: "Press back again to exit",
              child: WelcomeScreen(),
            ),
        LoginScreen.id: (context) => LoginScreen(),
        EnterDetailsScreen.id: (context) => EnterDetailsScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomePage.id: (context) => DoubleBack(
            message: "Press back again to exit",
            child: HomePage(),),
        ProfileScreen.id: (context) => ProfileScreen(),
        PaymentsScreen.id: (context) => PaymentsScreen(),
        BillPaymentSecondScreen.id: (context) => BillPaymentSecondScreen(),
        BillHistoryScreen.id: (context) => BillHistoryScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
