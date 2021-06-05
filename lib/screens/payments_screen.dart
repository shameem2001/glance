import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:glance/components/uploadIcon.dart';
import 'package:glance/screens/bill_payment_second_screen.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class PaymentsScreen extends StatefulWidget {
  static const String id = "payments_screen";

  const PaymentsScreen({Key key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  bool isEnabled = false;
  int billAmount = 0;
  int consumptionFromMeter = 0;

  List date = ['24/01/21', '22/03/21', '20/05/21'];
  List meterReading = [19275, 19581, 19860];
  List<int> consumption = [285, 306, 279];
  List amountPaid = [1227, 1530, 1189];
  List reciept = [80, 1, 4];

  @override
  void initState() {
    // TODO: implement initState
    getBillAmount();
    super.initState();
  }

  getBillAmount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    billAmount = sharedPreferences.getInt('calculatedBill');
    print(billAmount);
    setState(() {});
  }

  int newMeterReading;

  PickedFile _image;
  final picker= ImagePicker();
  Future pickImage(bool isCamera) async{
    PickedFile image;
    if(isCamera){
      image=(await picker.getImage(source: ImageSource.camera));
    }else{
      image=(await picker.getImage(source: ImageSource.gallery));
    }
    setState(() {
      _image=image;
    });
  }

  double calculateEnergyCharge(consumptionFromMeter){
    double energyCharge = 0;
    if(consumptionFromMeter <= 40)
      energyCharge = consumptionFromMeter * 1.5;
    if(40 < consumptionFromMeter && consumptionFromMeter <= 80)
      energyCharge = consumptionFromMeter * 2.2;
    if(80 < consumptionFromMeter && consumptionFromMeter <= 120)
      energyCharge = 176 + ((consumptionFromMeter - 80) * 3.0);
    if(120 < consumptionFromMeter && consumptionFromMeter <= 150)
      energyCharge = 296 + ((consumptionFromMeter - 120) * 3.8);
    if(150 < consumptionFromMeter && consumptionFromMeter <= 200)
      energyCharge = 410 + ((consumptionFromMeter - 150) * 5.3);
    if(200 < consumptionFromMeter && consumptionFromMeter <= 300)
      energyCharge = 675 + ((consumptionFromMeter - 200) * 6.5);
    if(300 < consumptionFromMeter && consumptionFromMeter <= 350)
      energyCharge = consumptionFromMeter * 5.0;
    if(350 < consumptionFromMeter && consumptionFromMeter <= 400)
      energyCharge = consumptionFromMeter * 5.5;
    if(400 < consumptionFromMeter && consumptionFromMeter <= 500)
      energyCharge = consumptionFromMeter * 6.0;
    if(consumptionFromMeter > 500)
      energyCharge = consumptionFromMeter * 7.0;
    return energyCharge;
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
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Meter\nReading',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Consumption',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Amount\nPaid',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Reciept',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(date[0]),
                                        ),
                                        DataCell(
                                            Text(meterReading[0].toString())),
                                        DataCell(
                                            Text(
                                                consumption[0].toString(),
                                                textAlign: TextAlign.center,
                                            ),),
                                        DataCell(
                                            Text(amountPaid[0].toString())),
                                        DataCell(
                                          UploadIcon(),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(date[1]),
                                        ),
                                        DataCell(
                                            Text(meterReading[1].toString())),
                                        DataCell(
                                            Text(consumption[1].toString(),
                                              textAlign: TextAlign.center,
                                            )),
                                        DataCell(
                                            Text(amountPaid[1].toString())),
                                        DataCell(
                                          UploadIcon(),
                                        ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(date[2]),
                                        ),
                                        DataCell(
                                            Text(meterReading[2].toString())),
                                        DataCell(
                                            Text(consumption[2].toString(),
                                              textAlign: TextAlign.center,
                                            ),),
                                        DataCell(
                                            Text(amountPaid[2].toString())),
                                        DataCell(
                                          UploadIcon(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Color(0x802196F3),
                            borderOnForeground: true,
                            child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    elevation: 1,
                                    context: context,
                                    builder: (context) => Container(
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 100,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  pickImage(false);
                                                },
                                                icon: Icon(
                                                  Icons.insert_drive_file,
                                                  color: Colors.black87,
                                                  size: 26,
                                                ),
                                              ),
                                              Text(
                                                'Documents',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    pickImage(true);
                                                  },
                                                  icon: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.black87,
                                                    size: 26,
                                                  )),
                                              Text(
                                                'Camera',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    pickImage(false);
                                                  },
                                                  icon: Icon(
                                                    Icons.image,
                                                    color: Colors.black87,
                                                    size: 26,
                                                  )),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'New reading',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          letterSpacing: 0.75,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Material(
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 18.0,
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
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
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 250,
                      height: 50,
                      child: new TextFormField(
                        onTap: () {
                          isEnabled = true;
                        },
                        onFieldSubmitted: (value){
                          newMeterReading = int.parse(value);
                        },
                        decoration: new InputDecoration(
                          hintText:
                              !isEnabled ? "Enter new meter reading" : null,
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            height: 2.5,
                          ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shadowColor: Colors.black,
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 2),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () async{
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        double energyCharge = 0;
                        int meterReadingLast = meterReading[meterReading.length - 1];
                        print(meterReadingLast);
                        consumptionFromMeter = newMeterReading - meterReadingLast;
                        energyCharge = calculateEnergyCharge(consumptionFromMeter);
                        double electricityDuty = energyCharge / 10;
                        double fixedCharge = 120;
                        double otherCharges = 98;
                        double netAmount = energyCharge + electricityDuty + fixedCharge + otherCharges;
                        int calculatedAmount = netAmount.ceil();
                        print(calculatedAmount);

                        sharedPreferences.setInt("energyCharge", energyCharge.ceil());
                        sharedPreferences.setInt("meterReadingLast", meterReadingLast);
                        sharedPreferences.setInt("newMeterReading", newMeterReading);
                        sharedPreferences.setInt("consumptionFromMeter", consumptionFromMeter);
                        sharedPreferences.setInt("electricityDuty", electricityDuty.ceil());
                        sharedPreferences.setInt("calculatedAmount", calculatedAmount);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                        child: Text(
                          'SAVE',
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
                    padding: const EdgeInsets.only(top: 10.0),
                    child: _buildRegisterBtn(context),
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

Widget _buildRegisterBtn(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 80),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () =>
            Navigator.pushReplacementNamed(context, BillPaymentSecondScreen.id),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CONTINUE',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    ),
  );
}
