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
        Form(
          key: _formKey_id,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Roll Number';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Roll Number'),
            onSaved: (v) => roll = v,
          ),
        ),
        Form(
          key: _formKey_pass,
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            onSaved: (v) => pass = v,
          ),
        ),
        RaisedButton(
          onPressed: () async {
            if (_formKey_id.currentState.validate() &&
                _formKey_pass.currentState.validate()) {
              _formKey_id.currentState.save();
              _formKey_pass.currentState.save();
              _formKey_id.currentState.reset();
              _formKey_pass.currentState.reset();
              showLoading(context, "Saving Data on Device");
              await writestorage(pass: pass,roll:roll);
              Navigator.pop(context);
              showLoading(context, "Data Saved. Contacting Server");
              await write_data_storage();
              Navigator.pop(context);
              showLoading(context, "Information Updated!");
              Navigator.pop(context); 
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Information Updated"),));         
              print(roll);
              print(pass);
              }
          },
          child: Text('Save'),
        )
      ],
    );
  }
}
