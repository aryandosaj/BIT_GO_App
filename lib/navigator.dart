import 'package:bitgo/dialog.dart';
import 'package:bitgo/examination.dart';
import 'package:bitgo/profile.dart';
import 'package:bitgo/result.dart';
import 'package:bitgo/update.dart';
import 'package:flutter/material.dart';

import 'attendence.dart';
import 'home.dart';

Widget change(String current) {
  // print(current);
  if (current == 'Login') {
    return new Profile();
  } else if (current == 'Attendance') {
    return new Attendence();
  } else if (current == 'Examination') {
    return new Examination();
  } else if (current == 'Result') {
    return new Result();
  } else if (current == 'Home') {
    return new Home();
  }
}

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Navigation();
  }
}

class _Navigation extends State<Navigation> {
  String title = 'BITGO';
  String current = 'Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(current),
              backgroundColor: Colors.lightBlue,
              actions: <Widget>[
                IconButton(
                    icon: Icon(IconData(0xe863, fontFamily: 'MaterialIcons')),
                    onPressed: () async {
                      showLoading(
                          context, "Data Read Successful.\n Contacting Server");

                      var r = await writeDataStorage();
                      setState(() {
                        current = 'Home';
                      });
                      Navigator.pop(context);
                      if (r == 1) {
                        showAlert(context, "Information Updated");
                      } else {
                        showAlert(context,
                            "Unable to Login. Check Username or Passwoed");
                      }
                    })
              ],
            ),
            body: change(current),
            drawer: Drawer(
              child: Container(
                
                color: Colors.white30,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage('images/drawerimage.jpg'),
                              fit: BoxFit.fill)),
                    ),
                    ListTile(
                      leading:  new Icon(Icons.home),

                      title: Text('Home',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1.2,),
                      onTap: () {
                        setState(() {
                          current = 'Home';
                        });

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading:  new Icon(Icons.send),
                      title: Text('Login',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1.2,),
                      onTap: () {
                        setState(() {
                          current = 'Login';
                        });

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading:  new Icon(Icons.assignment),
                      title: Text('Attendance',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1.2,),
                      onTap: () {
                        setState(() {
                          current = 'Attendance';
                        });

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading:  new Icon(Icons.assignment),
                      title: Text('Examination',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1.2,),
                      onTap: () {
                        setState(() {
                          current = 'Examination';
                        });

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading:  new Icon(Icons.assignment),
                      title: Text(
                        'Result',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textScaleFactor: 1.2,
                      ),
                      onTap: () {
                        setState(() {
                          current = 'Result';
                        });

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
