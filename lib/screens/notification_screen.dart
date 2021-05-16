import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glance/components/NotificationCard.dart';
import 'home_page.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = '/notify';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
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
      child: Scaffold(
        body: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white60,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RefreshIndicator(
                onRefresh: refreshList,
                color: Colors.black,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(33),
                        topRight: Radius.circular(33),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset: Offset(0, 7),
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            NotificationCard(),
                            NotificationCard(),
                            NotificationCard(),
                            NotificationCard(),
                            NotificationCard(),
                            NotificationCard(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
