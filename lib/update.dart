import 'package:bitgo/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';





Future<Map<String, dynamic>> fetchPost(roll, pass, i) {
  return http.post('https://4858d220.ngrok.io',
      body: {'Roll': roll, 'Password': pass}).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);
    if (i == 3) {
      throw new Exception("Error in loading");
    }
    if (statusCode < 200 || statusCode > 400 || json == null) {
      return fetchPost(roll, pass, i + 1);
    }
    return (json.decode(response.body));
  });
}


Future<String> get _local_data_Path async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _local_data_File async {
  final path = await _local_data_Path;
  return File('$path/data.json');
}

Future<String> read_data_storage() async {
  final file = await _local_data_File;
  try {
    print('Data File Reading : ');
    String s = (file.readAsStringSync());
    print('Data File Read Successful');
    return s;
  } catch (e) {
    print('Exception Occured:');
    print(e);
    print('Returned Null');
    return null;
  }
}

Future<int> write_data_storage() async {
  final cred = await readstorage();
  print(cred);
  var credential = await jsonDecode(cred);
  final file = await _local_data_File;
  Map<String, dynamic> storage = await fetchPost(credential['Roll'], credential['Password'], 0);
  await file.writeAsString(jsonEncode(storage),flush: true);
  await print("Data File Written");
  
  return 1;
}
