import 'package:flutter/material.dart';
// import 'package:editable/editable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glance/components/data_table_custom/dummy_users.dart';
import 'package:glance/components/data_table_custom/editable_page.dart';
import 'package:glance/models/table_appliances.dart';
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
  List appliance1 = ['Fan', 50, 2, 8];
  List appliance2 = ['Light', 20, 8, 6];
  List appliance3 = ['TV', 80, 1, 4];
  int calculatedBill = 0;
  double consumption = 0;

  List rows = [
    {"appliance": 'Fan', "power": "50W", "count": '2', "time": '8'},
    {"appliance": 'Light', "power": '20W', "count": '8', "time": '6'},
    {"appliance": 'TV', "power": '80W', "count": '1', "time": '4'},
  ];
//Headers or Columns
  List headers = [
    {"title": 'Appliance', "index": 1, "key": 'appliance'},
    {"title": 'Power', "index": 2, "key": 'power'},
    {"title": 'Count', "index": 3, "key": 'count'},
    {"title": 'Time', "index": 4, "key": 'time'},
  ];

  List<Appliances> applianceObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDatas();
  }

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
            SizedBox(
              height: 20,
            ),
            StaggeredGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 20.0, 8.0),
              children: [
                Center(child: EditablePage()),
                // _buildTile(
                //   Center(
                //     child: Editable(
                //       onSubmitted: (value){
                //         print(value);
                //         print(rows[0]['power']);
                //       },
                //       onRowSaved: (value){ //added line
                //         print(value);
                //         print(rows[0]['power']);//prints to console
                //       },
                //       thAlignment: TextAlign.center,
                //       thStyle: TextStyle(fontWeight: FontWeight.bold),
                //       thSize: 15,
                //       columns: headers,
                //       rows: rows,
                //       showCreateButton: true,
                //       tdStyle: TextStyle(fontSize: 15),
                //       tdAlignment: TextAlign.center,
                //       showSaveIcon: false,
                //       borderColor: Colors.white,
                //       borderWidth: 0.0,
                //     ),
                //   ),
                // DataTable(
                // headingTextStyle: TextStyle(
                //     color: Colors.black,
                // ),
                // dataTextStyle: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16
                // ),
                //   columns: <DataColumn>[
                //     DataColumn(
                //       label: Text(
                //         'Appliance',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //         'Power',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //         'Count',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     DataColumn(
                //       label: Text(
                //         'Time',
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                //   rows: <DataRow>[
                //     DataRow(
                //       cells: <DataCell>[
                //         DataCell(Text(appliance1[0]),),
                //         DataCell(Text('${appliance1[1].toString()}W')),
                //         DataCell(Text(appliance1[2].toString())),
                //         DataCell(Text(appliance1[3].toString())),
                //       ],
                //     ),
                //     DataRow(
                //       cells: <DataCell>[
                //         DataCell(Text(appliance2[0])),
                //         DataCell(Text('${appliance2[1].toString()}W')),
                //         DataCell(Text(appliance2[2].toString())),
                //         DataCell(Text(appliance2[3].toString())),
                //       ],
                //     ),
                //     DataRow(
                //       cells: <DataCell>[
                //         DataCell(Text(appliance3[0])),
                //         DataCell(Text('${appliance3[1].toString()}W')),
                //         DataCell(Text(appliance3[2].toString())),
                //         DataCell(Text(appliance3[3].toString())),
                //       ],
                //     ),
                //   ],
                // ),
                //),
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
                side: BorderSide(color: Colors.white, width: 1),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                List _power = [
                  double.parse(sharedPreferences.getString('power1')),
                  double.parse(sharedPreferences.getString('power2')),
                  double.parse(sharedPreferences.getString('power3'))
                ];
                List _count = [
                  double.parse(sharedPreferences.getString('count1')),
                  double.parse(sharedPreferences.getString('count2')),
                  double.parse(sharedPreferences.getString('count3'))
                ];
                List _time = [
                  double.parse(sharedPreferences.getString('time1')),
                  double.parse(sharedPreferences.getString('time2')),
                  double.parse(sharedPreferences.getString('time3'))
                ];

                for (int index = 0; index < 3; index++) {
                  double power = _power[index];
                  double count = _count[index];
                  double time = _time[index];
                  print(power);
                  print(count);
                  print(time);
                  print(power * count * time * 6);
                  consumption += (power * count * time * 6);
                }
                consumption = consumption / 1000;
                print(consumption);
                calculatedBill = (consumption * 6.75).toInt() + 110;
                print(calculatedBill);
                sharedPreferences.setInt('calculatedBill', calculatedBill);
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
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
                        style: GoogleFonts.poppins(
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
                            style: GoogleFonts.poppins(
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
