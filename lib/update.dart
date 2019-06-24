import 'package:bitgo/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

var defaultContent = {
  'Login': 'Unable to Login. Check your Username or Password',
  'Attendance': {
    'heading': [],
    'body': [],
    'message': 'Login to view Information'
  },
  'Examination': {
    'heading': [],
    'body': [],
    'message': 'Login to view Information'
  },
  'Result': {'heading': [], 'body': [], 'message': 'Login to view Information'}
};

Future<Map<String, dynamic>> fetchPost(roll, pass, i) {
  return http.post('https://2c6a34a9.ngrok.io',
      body: {'Roll': roll, 'Password': pass}).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);
    if (i == 3) {
      var content = {
        'Login': 'Unable to Login. Check your Username or Password',
        'Attendance': {'heading': [], 'body': [], 'message': 'Unable to Login'},
        'Examination': {
          'heading': [],
          'body': [],
          'message': 'Unable to Login'
        },
        'Result': {'heading': [], 'body': [], 'message': 'Unable to Login'}
      };
      return content;
    }
    if (statusCode < 200 || statusCode > 400 || json == null) {
      return fetchPost(roll, pass, i + 1);
    }
    return (json.decode(response.body));
  });
}

Future<String> get _localDataPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localDataFile async {
  final path = await _localDataPath;
  return File('$path/data.json');
}

Future<String> readDataStorage() async {
  final file = await _localDataFile;
  try {
    print('Data File Reading : ');
    String s = (file.readAsStringSync());
    print('Data File Read Successful');
    return s;
  } catch (e) {
    return jsonEncode(defaultContent);
  }
}

Future<int> writeDataStorage() async {
  final cred = await readstorage();
  print(cred);
  var credential = await jsonDecode(cred);
  final file = await _localDataFile;
  Map<String, dynamic> storage =
      await fetchPost(credential['Roll'], credential['Password'], 0);
  if (storage['Login'] == null) {
    await file.writeAsString(jsonEncode(storage), flush: true);
    await print("Data File Written");
    return 1;
  }
  return 0;
}
