import 'dart:convert';

import 'package:bitgo/storage.dart';
import 'package:flutter/material.dart';

class Attendence extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Attendence();
  }
}

class _Attendence extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: getCred(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.data == null) {
          return Container(
            child: Text('Loading'),
          );
        } else {
          return ListView(
            children: <Widget>[
              ListTile(title: Text('Roll Number : '+snapshot.data['Roll']),subtitle: Text('Password : '+snapshot.data['Password']))
              // Card(child: ListBody( Text('Roll Number : '+snapshot.data['Roll']))
            ],
          );
        }
      },
    ));
  }

  getCred() async {
    final cred = await readstorage();
    String mp = cred;
    var mp2 = json.decode(mp);
    print("Here");
    print(mp2['Roll']);
    String roll = mp2['Roll'];
    String pass = mp2['Password'];

    return mp2;
  }
}
