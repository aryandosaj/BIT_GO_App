import 'dart:convert';

import 'package:bitgo/storage.dart';
import 'package:bitgo/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';


class Attendence extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Attendence();
  }
}

class _Attendence extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return BidirectionalScrollViewPlugin(
        child: Container(
            child: FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.data == null) {
          return Container(
            child: Card(
              child: Text(
                'Loading',
                textScaleFactor: 2.0,
              ),
              margin: EdgeInsets.all(10.0),
            ),
          );
        } else {
          print(snapshot.data['heading']);
          if (snapshot.data['message'] == '0')
            return DataTable(
                columns: snapshot.data['heading']
                    .map<DataColumn>(
                        (name) => DataColumn(label: Text(name.toString())))
                    .toList(),
                rows: snapshot.data['body']
                    .map<DataRow>((entry) => DataRow(
                        cells: entry
                            .map<DataCell>((v) => DataCell(Text(v.toString())))
                            .toList()))
                    .toList());
          else
            return Container(
            child: Card(
              child: Text(
                snapshot.data['message'],
                textScaleFactor: 2.0,
              ),
              margin: EdgeInsets.all(10.0),
            ),
          );
        }
      },
    )));
  }

  getData() async {
    final attendanceDetailString = await read_data_storage();
    Map<String, dynamic> attendanceDetail = await jsonDecode(attendanceDetailString);
    print(attendanceDetail);
    return attendanceDetail['Attendance'];
  }
}
