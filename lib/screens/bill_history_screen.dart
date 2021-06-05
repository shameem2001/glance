import 'package:flutter/material.dart';
import 'package:editable/editable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glance/components/data_table_custom/dummy_users.dart';
import 'package:glance/components/data_table_custom/editable_page.dart';
import 'package:glance/models/table_appliances.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:editable/commons/helpers.dart';

class BillHistoryScreen extends StatefulWidget {
  static const String id = "bill_calculator_screen";

  const BillHistoryScreen({Key key}) : super(key: key);

  @override
  _BillHistoryScreenState createState() => _BillHistoryScreenState();
}

class _BillHistoryScreenState extends State<BillHistoryScreen> {
  List appliance1 = ['Fan', 50, 2, 8];
  List appliance2 = ['Light', 20, 8, 6];
  List appliance3 = ['TV', 80, 1, 4];
  int calculatedBill = 0;
  double consumption = 0;

  List rows = [
    {"Date": '20/01/20', "Meter\nreading": "17534", "Consumption": '291', "Amount\npaid": '₹1267',},
    {"Date": '21/03/20', "Meter\nreading": "17815", "Consumption": '281', "Amount\npaid": '₹1201',},
    {"Date": '20/05/20', "Meter\nreading": "18117", "Consumption": '302', "Amount\npaid": '₹1510',},
    {"Date": '23/07/20', "Meter\nreading": "18409", "Consumption": '292', "Amount\npaid": '₹1273',},
    {"Date": '22/09/20', "Meter\nreading": "18703", "Consumption": '294', "Amount\npaid": '₹1286',},
    {"Date": '20/11/20', "Meter\nreading": "18990", "Consumption": '287', "Amount\npaid": '₹1240',},
    {"Date": '24/01/21', "Meter\nreading": "19275", "Consumption": '285', "Amount\npaid": '₹1227',},
    {"Date": '22/03/21', "Meter\nreading": "19581", "Consumption": '306', "Amount\npaid": '₹1530',},
    {"Date": '20/05/21', "Meter\nreading": "19860", "Consumption": '279', "Amount\npaid": '₹1189',},
  ];

//Headers or Columns
  List columns = [
    {"title": 'Date', "index": 1, "key": 'Date'},
    {"title": 'Meter\nreading', "index": 2, "key": 'Meter\nreading'},
    {"title": 'Consumption', "index": 3, "key": 'Consumption'},
    {"title": 'Amount\npaid', "index": 4, "key": 'Amount\npaid'},
    // {"title": 'Reciept', "index": 5, "key": 'Reciept'},
  ];

  List<Appliances> applianceObject;

  int rowCount=9;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDatas();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, HomePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1.5,
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
              'Bill History',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50 * rowCount.toDouble(),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Editable(
                        rowCount: rowCount,
                        columnCount: 4,
                        columnRatio: 0.23,
                        zebraStripe: true,
                        stripeColor1: Colors.white,
                        stripeColor2: Colors.grey[500],
                        trHeight: 20,
                        onSubmitted: (value) {
                          print(value);
                          print(rows[0]['power']);
                        },
                        onRowSaved: (value) {
                          //added line
                          print(value);
                          print(rows[0]['power']); //prints to console
                        },
                        thAlignment: TextAlign.center,
                        thStyle: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: columns,
                        rows: rows,
                        showCreateButton: false,
                        tdStyle: TextStyle(fontSize: 12),
                        tdAlignment: TextAlign.center,
                        showSaveIcon: false,
                        borderColor: Colors.black,
                        borderWidth: 0.5,
                        thVertAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.black, width: 2),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // List _power = [
                      //   double.parse(sharedPreferences.getString('power1')),
                      //   double.parse(sharedPreferences.getString('power2')),
                      //   double.parse(sharedPreferences.getString('power3'))
                      // ];
                      // List _count = [
                      //   double.parse(sharedPreferences.getString('count1')),
                      //   double.parse(sharedPreferences.getString('count2')),
                      //   double.parse(sharedPreferences.getString('count3'))
                      // ];
                      // List _time = [
                      //   double.parse(sharedPreferences.getString('time1')),
                      //   double.parse(sharedPreferences.getString('time2')),
                      //   double.parse(sharedPreferences.getString('time3'))
                      // ];
                      //
                      // for (int index = 0; index < 3; index++) {
                      //   double power = _power[index];
                      //   double count = _count[index];
                      //   double time = _time[index];
                      //   print(power);
                      //   print(count);
                      //   print(time);
                      //   print(power * count * time * 6);
                      //   consumption += (power * count * time * 6);
                      // }
                      // consumption = consumption / 1000;
                      // print(consumption);
                      // calculatedBill = (consumption * 6.75).toInt() + 110;
                      // print(calculatedBill);
                      // sharedPreferences.setInt('calculatedBill', calculatedBill);
                      rows = addOneRow(columns, rows);
                      rowCount++;
                      setState(() {});
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ADD ITEM',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.add, size: 26,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
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
                  // SizedBox(
                  //   height: 80,
                  // ),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             "Estimated Bill Amount:",
                  //             style: GoogleFonts.poppins(
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 18.0),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       Column(
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text(
                  //                 "₹ $calculatedBill",
                  //                 style: GoogleFonts.poppins(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.w600,
                  //                     fontSize: 20.0),
                  //               ),
                  //             ],
                  //           ),
                  //           Container(
                  //             width: 60,
                  //             height: 2,
                  //             color: Colors.black,
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.white,
      // shadowColor: Color(0x802196F3),
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
