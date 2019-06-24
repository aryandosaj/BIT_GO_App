import 'package:flutter/material.dart';
// class DialogLoad{

void showLoading(BuildContext context, String title) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return WillPopScope(
          onWillPop: () async => false,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 230.0, horizontal: 1.0),
              child: AlertDialog(
                content: Row(
                  children: <Widget>[
                    Text(title),
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
                    CircularProgressIndicator(strokeWidth: 2.0)
                  ],
                ),
              )));
    },
  );
}

void showAlert(BuildContext context, String title) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(padding:EdgeInsets.symmetric(vertical: 230.0, horizontal: 1.0) ,child:AlertDialog(
          content:new Text(title) ,
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
  );
  }
  );
}

// }
