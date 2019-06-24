import 'dart:convert';

import 'package:bitgo/dialog.dart';
import 'package:bitgo/update.dart';
import 'package:flutter/material.dart';

import 'storage.dart';

class Profile extends StatelessWidget {
  final _formKey_id = GlobalKey<FormState>();
  final _formKey_pass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('Profile: Build');
    String pass;
    String roll;
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Container(
          height: 220.0,
          width: 110.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bitlogin.png'),
                fit: BoxFit.contain),
          ),
        ),
        Form(
          key: _formKey_id,
          child: TextFormField(
            decoration: InputDecoration(
              // hintText: hint,
              labelText: "Roll Number",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Roll Number';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            onSaved: (v) => roll = v,
          ),
        ),
        SizedBox(
          width: 20.0,
          height: 20.0,
        ),
        Form(
          key: _formKey_pass,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            obscureText: true,
            onSaved: (v) => pass = v,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 80.0),
            child: FlatButton(splashColor: Colors.white,color: Colors.lightBlue,
              onPressed: () async {
                if (_formKey_id.currentState.validate() &&
                    _formKey_pass.currentState.validate()) {
                  _formKey_id.currentState.save();
                  _formKey_pass.currentState.save();
                  _formKey_id.currentState.reset();
                  _formKey_pass.currentState.reset();
                  showLoading(context, "Saving Data on Device");
                  await writestorage(pass: pass, roll: roll);
                  Navigator.pop(context);
                  showLoading(context, "Data Saved.\nContacting Server");
                  var r = await writeDataStorage();
                  Navigator.pop(context);
                  if (r == 1)
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Information Updated"),
                    ));
                  else
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Unable to Login. Check your Username or Password"),
                    ));
                  print(roll);
                  print(pass);
                }
              },
              child: Text('Login',style: TextStyle(
                          color: Colors.white,
                        ),),
            ))
      ],
    );
  }
}
