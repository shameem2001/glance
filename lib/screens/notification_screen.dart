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
        if(Navigator.canPop(context)){
          Navigator.pop(context);
          return true;
        }
        else{
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
              color: Color(0xff164B77),
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Executive App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          color: Colors.white,
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
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(33),
                      topRight: Radius.circular(33),
                    ),
                  ),
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
