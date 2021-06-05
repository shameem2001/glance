
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glance/utils/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DrawerBeta extends StatefulWidget {
  static const String id = "/DraweBeta";
  @override
  DrawerBetaState createState() => DrawerBetaState();
}

class DrawerBetaState extends State<DrawerBeta> {

  bool _isSigningOut = false;

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
                  'Daliya Joseph',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                accountEmail: Text(
                  'daliya.joseph@gmail.com',
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
                leading: Icon(FontAwesomeIcons.userCircle, color: Colors.black,),
                // SvgPicture.asset('assets/svg/supportdrawer.svg',height: 22,),
                title: Text('Support',style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.w800),),
              ),
              Divider(height: 10,thickness: 1,),
              GestureDetector(
                onTap: () {
                //  navigate to settings screen.
                },
                child: ListTile(
                  leading: Icon(Icons.settings,color: primaryColour,),
                  title: Text('Settings',style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                      fontWeight: FontWeight.w800),),
                ),
              ),
              Divider(height: 10,thickness: 1,),
              GestureDetector(
                onTap: () async{
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  setState(() {
                    _isSigningOut = true;
                  });
                  await Authentication.signOut(context: context);
                  sharedPreferences.setBool('isLoggedIn', false);
                  setState(() {
                    _isSigningOut = false;
                  });
                },
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt,color: primaryColour,),
                  title: Text('Logout',style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                      fontWeight: FontWeight.w800),),
                ),
              ),
              Divider(height: 10,thickness: 1,),
              SizedBox(height: 70,)
            ],
          ),
        )
    );
  }
}
