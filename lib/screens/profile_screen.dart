import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glance/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

Color grey = Color(0xfff2f2f2);

class ProfileScreen extends StatefulWidget {
  static const String id = "profile_screen";

  // final String username;
  // final String bio;
  // final String student;
  // final String initial;

  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  String username = "Daliya Joseph";
  String emailId = "daliya.joseph@gmail.com";
  String mobileNumber = "+919876543210";
  String subscriptionNumber = "85687495349";
  String address = "Kalady, Ernakulam";
  String pin = "683574";
  String state = "Kerala";

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,

            leading: GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, HomePage.id);
              },
              child: new Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.0,
              ),
            ),
            centerTitle: true,
            title: Text('Profile',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.black)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: new Container(
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Container(
                      height: 230.0,
                      color: Colors.white,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: new Stack(fit: StackFit.loose, children: <Widget>[
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Container(
                                      width: 140.0,
                                      height: 140.0,
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                              'assets/profile2.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 25.0,
                                        child: new Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )),
                            ]),
                          ),
                          SizedBox(height: 20,),
                          Text(username,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),),
                        ],
                      ),
                    ),
                    new Container(
                      color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Personal Information',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        _status ? _getEditIcon() : new Container(),
                                      ],
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Name',
                                          style: GoogleFonts.poppins(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: username,
                                        decoration: const InputDecoration(
                                          hintText: "Enter name",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        autofocus: !_status,
                                        onFieldSubmitted: (value){
                                          username = value;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Email ID',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: emailId,
                                        decoration: const InputDecoration(
                                          hintText: "Enter email id",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        onFieldSubmitted: (value){
                                          emailId = value;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Mobile Number',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: mobileNumber,
                                        decoration: const InputDecoration(
                                          hintText: "Enter mobile number",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        onFieldSubmitted: (value){
                                          mobileNumber = value;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Subscription Number',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: subscriptionNumber,
                                        decoration: const InputDecoration(
                                          hintText: "Enter mobile number",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        onFieldSubmitted: (value){
                                          subscriptionNumber = value;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Address',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextFormField(
                                        initialValue: address,
                                        decoration: const InputDecoration(
                                          hintText: "Enter subscription number",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        onFieldSubmitted: (value){
                                          address = value;
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          'Pin Code',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          'State',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new TextFormField(
                                          initialValue: pin,
                                          decoration: const InputDecoration(
                                            hintText: "Enter pin",
                                            hintStyle: khintTextStyle,
                                          ),
                                          enabled: !_status,
                                          onFieldSubmitted: (value){
                                            pin = value;
                                          },
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Flexible(
                                      child: new TextFormField(
                                        initialValue: state,
                                        decoration: const InputDecoration(
                                          hintText: "Enter State",
                                          hintStyle: khintTextStyle,
                                        ),
                                        enabled: !_status,
                                        onFieldSubmitted: (value){
                                          state = value;
                                        },
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )),
                            !_status ? _getActionButtons() : new Container(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
          // body: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(32.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           CircleAvatar(
          //             backgroundColor: Colors.blue,
          //             child: Text("J",// give Text(initial,..) instead.
          //               style: TextStyle(
          //                 fontFamily: 'Raleway', fontWeight: FontWeight.bold,
          //                 fontSize: 40,
          //                 color: Colors.white,
          //               ),
          //             ),
          //             radius: 48,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(4.0),
          //                   child: Text(
          //                     'John Doe',// give username instead.
          //                     style: TextStyle(
          //                         fontFamily: 'Raleway',
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 32),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(4.0),
          //                   child: Text("student"),// give Text(student) instead.
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(4.0),
          //                   child: Text("bio"),// give Text(bio) instead.
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

const khintTextStyle = TextStyle(
  color: Colors.black54,
);