import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glance/components/drawer.dart';
import 'package:glance/screens/notification_screen.dart';
import 'package:glance/screens/payments_screen.dart';
import 'package:glance/screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bill_history_screen.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static const String id = "home_page";
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  User user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;
  _HomePageState({this.user});

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      if(currentIndex == 0)
        Navigator.pushReplacementNamed(context, BillHistoryScreen.id);
      else if(currentIndex == 1)
        Navigator.pushReplacementNamed(context, PaymentsScreen.id);
      else if(currentIndex == 2)
        Navigator.pushReplacementNamed(context, ProfileScreen.id);
    });
  }

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        drawer: DrawerBeta(),
        bottomNavigationBar: Container(
          width: size.width,
          height: 80,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: BNBCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(backgroundColor: Colors.black,
                    child: Icon(FontAwesomeIcons.rupeeSign, size: 30,),
                    elevation: 2,
                    onPressed: () {
                      setBottomBarIndex(1);
                    }),
              ),
              Container(
                width: size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.receipt,
                          size: 32,
                          color: currentIndex == 0 ? Colors.black : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          print("Pressed");
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.solidUser,
                            size: 32,
                            color: currentIndex == 3 ? Colors.black : Colors.black,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              // IconButton(
              //     icon: Icon(
              //       Icons.notifications_none_outlined,
              //       color: Colors.black,
              //       size: 30,
              //     ),
              //     onPressed: () {
              //       // Navigator.pushNamed(context, NotificationScreen.id);
              //     }),
            ]),
        body: Stack(
          children: [
            StaggeredGridView.count(
              shrinkWrap: false,
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 20.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text(
                            "Hello,",
                            style: GoogleFonts.raleway(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            "\t\tDaliya",
                            style: GoogleFonts.raleway(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Daily Usage',
                                style: TextStyle(color: Colors.blueAccent, fontSize: 16.0)),
                            SizedBox(height: 5,),
                            Text(' 18 units',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32.0))
                          ],
                        ),
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline,
                                  color: Colors.white, size: 30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildTile(
                  Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Usage Statistics',
                                      style: TextStyle(color: Colors.green, fontSize: 16.0)),
                                  SizedBox(height: 7,),
                                  Text(' 127 units',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32.0)),
                                ],
                              ),
                              DropdownButton(
                                  isDense: true,
                                  value: actualDropdown,
                                  onChanged: (String value) => setState(() {
                                        actualDropdown = value;
                                        actualChart = chartDropdownItems
                                            .indexOf(value); // Refresh the chart
                                      }),
                                  items: chartDropdownItems.map((String title) {
                                    return DropdownMenuItem(
                                      value: title,
                                      child: Text(title,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0)),
                                    );
                                  }).toList())
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 4.0)),
                          Sparkline(
                            data: charts[actualChart],
                            lineWidth: 5.0,
                            lineColor: Colors.greenAccent,
                          )
                        ],
                      )),
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 100.0),
                StaggeredTile.extent(2, 115.0),
                StaggeredTile.extent(2, 225.0),
              ],
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
      shadowColor: Color(0x802196F3),
      // shadowColor: Colors.grey[400],
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
            print('Not set yet');
          },
          child: child));
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}