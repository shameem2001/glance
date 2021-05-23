
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DrawerBeta extends StatefulWidget {
  static const String id = "/DraweBeta";
  @override
  DrawerBetaState createState() => DrawerBetaState();
}

class DrawerBetaState extends State<DrawerBeta> {
  Color primaryColour = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                accountEmail: Text(
                  'johndoe@gmail.com',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                currentAccountPicture: Container(
                  height: 60,
                  child: Image.asset('assets/app_icon.png'),
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
              Divider(height: 10,thickness: 1,),
              ListTile(
                leading: SvgPicture.asset('assets/svg/supportdrawer.svg',height: 22,),
                title: Text('Support',style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.w800),),
              ),
              Divider(height: 10,thickness: 1,),
              ListTile(
                leading: Icon(Icons.logout,color: primaryColour,),
                title: Text('Logout',style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.w800),),
              ),
              SizedBox(height: 70,)
            ],
          ),
        )
    );
  }
}
