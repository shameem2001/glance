import 'package:flutter/material.dart';

class BillCalculatorScreen extends StatefulWidget {
  static const String id = "bill_calculator_screen";
  const BillCalculatorScreen({Key key}) : super(key: key);

  @override
  _BillCalculatorScreenState createState() => _BillCalculatorScreenState();
}

class _BillCalculatorScreenState extends State<BillCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
