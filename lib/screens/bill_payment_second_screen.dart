import 'package:flutter/material.dart';
import 'package:glance/screens/payments_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class BillPaymentSecondScreen extends StatefulWidget {
  static const String id = "bill_payment_second_screen";

  const BillPaymentSecondScreen({Key key}) : super(key: key);

  @override
  _BillPaymentSecondScreenState createState() => _BillPaymentSecondScreenState();
}

class _BillPaymentSecondScreenState extends State<BillPaymentSecondScreen> {

  int calculatedAmount = 0;
  int prevReading = 0;
  int newReading = 0;
  int consumption = 0;
  int energyCharge = 0;
  int electricityDuty = 0;

  String uri = "https://wss.kseb.in/selfservices/quickpay";
  void _launchURL() async =>
      await canLaunch(uri) ? await launch(uri) : throw 'Could not launch $uri';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCalculatedBill();
  }

  getCalculatedBill() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    calculatedAmount = sharedPreferences.getInt("calculatedAmount");
    prevReading = sharedPreferences.getInt("meterReadingLast");
    newReading = sharedPreferences.getInt("newMeterReading");
    consumption = sharedPreferences.getInt("consumptionFromMeter");
    energyCharge = sharedPreferences.getInt("energyCharge");
    electricityDuty = sharedPreferences.getInt("electricityDuty");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, PaymentsScreen.id);
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
                Navigator.popAndPushNamed(context, PaymentsScreen.id);
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
          body: SingleChildScrollView(
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 360,
                          width: 360,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/tariff.png'),
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  DataDetails(title:"Previous reading:", amount:"$prevReading units"),
                  DataDetails(title:"New reading:", amount:"$newReading units"),
                  DataDetails(title:"Consumption:", amount:"$consumption units"),
                  DataDetails(title:"Energy charge:", amount:"$energyCharge Rs"),
                  DataDetails(title:"Fixed charge:", amount:"120 Rs"),
                  DataDetails(title:"Electricity duty:", amount:"$electricityDuty Rs"),
                  DataDetails(title:"Other charges:", amount:"98 Rs"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 40.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/1.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: ListTile(
                          isThreeLine: false,
                          horizontalTitleGap: 10.0,
                          title: Text("Net amount payable:",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 2.2,
                            ),
                          ),
                          trailing: Text("₹$calculatedAmount",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              height: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
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
                          'PAY AMOUNT',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DataDetails extends StatelessWidget {
  final String title;
  final String amount;
  DataDetails({
    @required this.title,
    @required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width/1.4,
        child: ListTile(
          isThreeLine: false,
          horizontalTitleGap: 10.0,
          title: Text(title,
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 17,
          ),
          ),
          trailing: Text(amount,
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
