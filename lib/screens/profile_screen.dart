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

class _ProfileScreenState extends State<ProfileScreen> {
  String initial;
  String username;
  String bio;
  String student;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black, size: 28,), onPressed: () {Navigator.popAndPushNamed(context, HomePage.id);},),
          title: Text('My Profile', style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 26,
          ),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'),
                foregroundColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text(
                "John Doe",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 20, right: 20, left: 30, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '2',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            'Full Name:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'John Doe',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            'Email:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'johndoe@gmail.com',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            'Phone Number:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '9065764532',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            'Subscription Number:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '90564',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Password:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                  //
                                ),
                            ],
                          ),
                          Text(
                            '********',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          /*Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Executive Id',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Full Name',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Executive Name',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Executive@mail.id',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '********',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff748A9D),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),*/
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
    );
  }
}
