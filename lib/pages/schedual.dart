import 'package:dars_360/models/classTimeTable_model.dart';
import 'package:flutter/material.dart';

import '../ApiProvider.dart';

class Schedual extends StatefulWidget {
  @override
  _SchedualState createState() => _SchedualState();
}

class _SchedualState extends State<Schedual> {
  List<ClassTimeTableModel> classTimeTableList = List<ClassTimeTableModel>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAss();
  }

  void getAss() async {
    classTimeTableList = await ApiProvider().getClassTimeTable();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "جدول الحصص",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: classTimeTableList
                      .map((i) => Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text("${i.dayName}",),
                      ),
                      Column(
                        children: i.periodList.map(
                            (k) =>
                                Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          child: Text("${k.subjectName}"),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("${k.startTime}"),
                                            Text("-"),
                                            Text("${k.endTime}"),
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          alignment: Alignment.centerRight,
                                          child: Text("${k.periodName}"),
                                        )
                                      ],
                                    )
                                  ],
                                )
                        ).toList(),
                      )
                    ],
                  ))
                      .toList(),
                ),
              ));
  }
}
