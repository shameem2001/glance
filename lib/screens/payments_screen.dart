import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  static const String id = "payments_screen";

  const PaymentsScreen({Key key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
