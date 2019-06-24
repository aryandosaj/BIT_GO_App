import 'package:bitgo/storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
   
    
    return Container(
        decoration: BoxDecoration(
          image: new DecorationImage(image: AssetImage('images/homepage.jpg'),fit: BoxFit.fill),

        ),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('images/bitlogo.png'),
                )),
            FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Text('Loading');
                } else {
                  return ListTile(
                    title:  Center(child: Text(snapshot.data,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textScaleFactor: 1.5,)),

                    // title: Text("Roll Number : " + snapshot.data,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
                  );
                }
              },
            ),
          ],
        ));
  }

  getData() async {
    var data = await readstorage();
    var dataDict = jsonDecode(data);
    return dataDict['Roll'];
  }
}
