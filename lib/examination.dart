import 'dart:convert';
import 'package:bitgo/update.dart';
import 'package:flutter/material.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';


class Examination extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Examination();
  }
}

class _Examination extends State<Examination> {
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
    final examinationDetailString = await read_data_storage();
    Map<String, dynamic> examinationDetail = await jsonDecode(examinationDetailString);
    print(examinationDetail);
    return examinationDetail['Examination'];
  }
}