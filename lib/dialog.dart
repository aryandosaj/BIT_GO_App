import 'package:flutter/material.dart';
// class DialogLoad{

void showLoading(BuildContext context, String title) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return WillPopScope(
        onWillPop: () async =>false,
          child: AlertDialog(
        title: new Text(title),
        content: new Center(child: CircularProgressIndicator(strokeWidth: 3.0)),
        // actions: <Widget>[
        //   // usually buttons at the bottom of the dialog
        //   new FlatButton(
        //     child: new Text("Close"),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      ));
    },
  );
}
// }
