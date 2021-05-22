import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillCalculatorScreen extends StatefulWidget {
  static const String id = "bill_calculator_screen";

  const BillCalculatorScreen({Key key}) : super(key: key);

  @override
  _BillCalculatorScreenState createState() => _BillCalculatorScreenState();
}

class _BillCalculatorScreenState extends State<BillCalculatorScreen> {
  double consumption;
  int calculatedBill = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white.withOpacity(0.9),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, HomePage.id);
            },
          ),
          title: Text(
            'Bill Calculator',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            StaggeredGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                _buildTile( DataTable(
                  headingTextStyle: TextStyle(
                      color: Colors.black,
                  ),
                  dataTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Appliance',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Power',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Count',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Time',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Fan')),
                          DataCell(Text('50W')),
                          DataCell(Text('2')),
                          DataCell(Text('8')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Light')),
                          DataCell(Text('20W')),
                          DataCell(Text('8')),
                          DataCell(Text('6')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('TV')),
                          DataCell(Text('80W')),
                          DataCell(Text('1')),
                          DataCell(Text('4')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 200.0),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Color(0x802196F3),
                primary: Colors.white,
                backgroundColor: Colors.black,
                side: BorderSide(
                    color: Colors.white, width: 1),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () async{
                calculatedBill = 269;
                SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
                sharedPreferences.setInt(
                    'calculatedBill', calculatedBill);
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 12.0),
                child: Text(
                  'Calculate',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: 200,
            //     child: TextField(
            //       onSubmitted: (value) {
            //         consumption = double.parse(value);
            //       },
            //       textInputAction: TextInputAction.done,
            //       decoration: InputDecoration(
            //           hintText: "Enter Consumption",
            //           hintStyle: TextStyle(
            //               fontWeight: FontWeight.w500, color: Colors.grey)),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 80,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Estimated Bill Amount:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₹ $calculatedBill",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 2,
                        color: Colors.black,
                      )
                    ],
                  )
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
      shadowColor: Color(0x802196F3),
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
