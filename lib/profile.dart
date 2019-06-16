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
            onSaved: (v)=>roll =v ,
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
            onSaved: (v) => pass =v ,
          ),
        ),
        RaisedButton(
          // padding: EdgeInsets.all(5.0),
          onPressed: () {
            
            if (_formKey_id.currentState.validate()&&_formKey_pass.currentState.validate()) {
              
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Information Saved')));
                _formKey_id.currentState.save();
                _formKey_pass.currentState.save();
                print(roll);
                print(pass);
            }
            _formKey_id.currentState.reset();
            _formKey_pass.currentState.reset();
            writestorage(pass: pass,roll: roll);
          },
          child: Text('Save'),
        )
      ],
    );
  }
}
