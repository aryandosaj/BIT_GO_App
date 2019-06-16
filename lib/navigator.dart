import 'package:bitgo/profile.dart';
import 'package:flutter/material.dart';

import 'attendence.dart';

Widget change(String current) {
  // print(current);
  if (current == 'Profile') {
    return new Profile();
  } else if (current == 'Attendance') {
    return new Attendence();
  } else {
    
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
  String current='Home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(current) ,
        backgroundColor: Colors.orange,
      ),
      body: change(current),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text('BITGO',),widthFactor: 10.0,),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  current = 'Profile';
                });

                // Navigation.push(context, MaterialPageRoute(builder: (context)=>new Profile()));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Attendance'),
              onTap: () {
                setState(() {
                  current = 'Attendance';
                });

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
