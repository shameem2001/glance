import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentsScreen extends StatefulWidget {
  static const String id = "payments_screen";

  const PaymentsScreen({Key key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {

  String uri = "https://wss.kseb.in/selfservices/quickpay";

  bool isEnabled = false;
  int billAmount = 0;

  List date = ['01/01/21', '01/03/21', '01/05/21'];
  List meterReading = [19275, 19581, 19860];
  List consumption = [285, 306, 279];
  List amountPaid = [1930, 2036, 1874];
  List reciept = [80, 1, 4];

  @override
  void initState() {
    // TODO: implement initState
    getBillAmount();
    super.initState();
  }

  getBillAmount() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    billAmount = sharedPreferences.getInt('calculatedBill');
    print(billAmount);
    setState(() {
    });
  }

  void _launchURL() async =>
      await canLaunch(uri) ? await launch(uri) : throw 'Could not launch $uri';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(Navigator.canPop(context)){
          Navigator.pop(context);
          return true;
        }
        else{
          Navigator.popAndPushNamed(context, HomePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, HomePage.id);
              },
            ),
            title: Text(
              "Bill Payment",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: StaggeredGridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 24.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      children: [
                        _buildTile(
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DataTable(
                                headingTextStyle: TextStyle(
                                    color: Colors.black,
                                  fontSize: 14,
                                ),
                                dataTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                ),
                                  columnSpacing: 14,
                                  columns: <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        'Date',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Meter\nReading',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Consumption',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Amount\nPaid',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Reciept',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(date[0]),),
                                        DataCell(Text(meterReading[0].toString())),
                                        DataCell(Text(consumption[0].toString())),
                                        DataCell(Text(amountPaid[0].toString())),
                                        DataCell(Icon(Icons.download_rounded, color: Colors.black87,)),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(date[1]),),
                                        DataCell(Text(meterReading[1].toString())),
                                        DataCell(Text(consumption[1].toString())),
                                        DataCell(Text(amountPaid[1].toString())),
                                        DataCell(Icon(Icons.download_rounded, color: Colors.black87,)),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(date[2]),),
                                        DataCell(Text(meterReading[2].toString())),
                                        DataCell(Text(consumption[2].toString())),
                                        DataCell(Text(amountPaid[2].toString())),
                                        DataCell(Icon(Icons.download_rounded, color: Colors.black87,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90.0),
                          child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Color(0x802196F3),
                              borderOnForeground: true,
                              child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('New reading',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        ),
                                        Material(
                                          elevation: 2.0,
                                          borderRadius: BorderRadius.circular(40.0),
                                          child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 18.0,
                                              child: Icon(Icons.camera_alt, size:22,  color: Colors.black,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),),
                        ),
                      ],
                      staggeredTiles: [
                        StaggeredTile.extent(2, 230),
                        StaggeredTile.extent(2, 52),
                        // StaggeredTile.extent(2, 200),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            child: new TextFormField(
                              decoration: new InputDecoration(
                                hintMaxLines: 1,
                                hintText: "Previous amount: 2134",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                enabled: false,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Email cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                            ),),
                          flex: 3,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: new TextFormField(
                              onTap: (){
                                isEnabled = true;
                              },
                              decoration: new InputDecoration(
                                labelText: isEnabled?'Current amount': null,
                                alignLabelWithHint: true,
                                hintText: !isEnabled?"Current amount: 1234":null,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Email cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                            ),),
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shadowColor: Colors.black,
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                            color: Colors.black, width: 2),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () async{
                        //  google pay hyperlink.
                        await _launchURL();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                        child: Text(
                          'CALCULATE',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shadowColor: Color(0x802196F3),
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                        side: BorderSide(
                            color: Colors.white, width: 1),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () async{
                        //  google pay hyperlink.
                        await _launchURL();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
                        child: Text(
                          'Calculated amount:  ₹1243',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            //letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child));
}
