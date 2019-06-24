import 'dart:async';
import 'dart:io';
import 'package:bitgo/update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
var defaultData = {'Roll':'XXXXXXXXX','Pass':'12345678'};

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/credentials.json');
}

Future<String> readstorage() async {
  final file = await _localFile;

  try {
    print('File Reading : ');
    String s = (file.readAsStringSync());
    print('File Read Successful');
    return s;
  } catch (e) {
    print('Exception Occured:');
    print(e);
    print('Returned Null');
    return jsonEncode(defaultData);
  }
}

Future<int> writestorage({String pass, String roll}) async {
  
  final file = await _localFile;
  Map<String, String> storage = {'Roll': roll, 'Password': pass};
  await file.writeAsString(jsonEncode(storage),flush: true);
  await print("File Written"); 
  return 1;
}
