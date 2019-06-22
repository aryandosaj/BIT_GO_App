import 'dart:convert';

import 'package:bitgo/dialog.dart';
import 'package:bitgo/examination.dart';
import 'package:bitgo/profile.dart';
import 'package:bitgo/result.dart';
import 'package:bitgo/storage.dart';
import 'package:bitgo/update.dart';
import 'package:flutter/material.dart';

import 'attendence.dart';

Widget change(String current) {
  // print(current);
  if (current == 'Profile') {
    return new Profile();
  } else if (current == 'Attendance') {
    return new Attendence();
  } else if (current=='Examination')
  {
    return new Examination();
  }
  else if(current=='Result')
  {
    return new Result();
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

  // Future refresh() async {

  //    setState(() async {
  //      print("Navigation : Refresh");
  //                 await write_data_storage();
  //               });
    
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(current),
        backgroundColor: Colors.blue[150],
        actions: <Widget>[
          IconButton(
              icon: Icon(IconData(0xe863, fontFamily: 'MaterialIcons')),
              onPressed: () async {
              showLoading(context, "Data Read Successful. Contacting Server");
              await write_data_storage();
              Navigator.pop(context);
              showLoading(context, "Information Updated!");
              Navigator.pop(context);             
                
              })
        ],
      ),
      body: change(current),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'BITGO',
                ),
                widthFactor: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
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
            ListTile(
              title: Text('Examination'),
              onTap: () {
        
                setState(() {
                  current = 'Examination';
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Result'),
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
    ));
  }
}
