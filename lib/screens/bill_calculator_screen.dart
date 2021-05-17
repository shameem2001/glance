import 'package:flutter/material.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BillCalculatorScreen extends StatefulWidget {
  static const String id = "bill_calculator_screen";

  const BillCalculatorScreen({Key key}) : super(key: key);

  @override
  _BillCalculatorScreenState createState() => _BillCalculatorScreenState();
}

class _BillCalculatorScreenState extends State<BillCalculatorScreen> {
  double consumption;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.9),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () {
              Navigator.popAndPushNamed(context, HomePage.id);
            },
          ),
          title: Text('Bill Calculator', style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),),
        ),
        body: Column(
          children: [
            GridView.count(
              padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 15),
              physics: BouncingScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 12.0,
              shrinkWrap: true,
              children: [
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Tier 1',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                              ),),
                          Text('\$123',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0))
                        ],
                      ),
                    ),
                  ),
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Tier 2',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text('\$234',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0))
                        ],
                      ),
                    ),
                  ),
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Tier 3',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text('\$345',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Center(
              child: Container(
                width: 200,
                child: TextField(
                  onSubmitted: (value){
                    consumption = double.parse(value);
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: "Enter Consumption",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Expected Bill:", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0),),
                  SizedBox(width: 10,),
                  Text("\$259", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0),),
                ],
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.white,
      shadowColor: Colors.grey,
      child: InkWell(
        hoverColor: Colors.grey,
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child));
}
