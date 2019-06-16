import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
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
    // print(file.readAsStringSync());
    String s = (file.readAsStringSync());;
    // Map<String, String> contents = jsonDecode(file.readAsStringSync());
    print('File Read Successful');
    return s;
  } catch (e) {
    print('Exception Occured:');
    print(e);
    print('Returned Null');
    return null;
  }
}

void writestorage({String pass, String roll}) async {
  
  final file = await _localFile;
  Map<String, String> storage = {'Roll': roll, 'Password': pass};
  file.writeAsString(jsonEncode(storage));
  print("File Written");
  return;
}
