import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsScreen extends StatefulWidget {
  static const String id = "payments_screen";

  const PaymentsScreen({Key key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
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
            "Payments",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: StaggeredGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    children: [
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Payment History",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                              GridView.count(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15),
                                physics: BouncingScrollPhysics(),
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                shrinkWrap: true,
                                children: [
                                  _buildTile(
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Jun',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'July',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Aug',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text('\$345',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18.0))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20, left: 60, right: 60),
                        child: _buildTile(
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 22.0, horizontal: 32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'This Month',
                                  style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shadowColor: Color(0x802196F3),
                                    primary: Colors.white,
                                    backgroundColor: Colors.black,
                                    side: BorderSide(
                                        color: Colors.white, width: 1),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 12.0),
                                    child: Text(
                                      'Amount: \$259',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(2, 200),
                      StaggeredTile.extent(2, 200),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shadowColor: Color(0x802196F3),
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    side: BorderSide(
                        color: Colors.white, width: 1),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                  //  google pay hyperlink.
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 12.0),
                    child: Text(
                      'Pay Amount',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
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
