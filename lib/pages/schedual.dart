import 'dart:convert';

import 'package:dars_360/components/Schedual_card.dart';
import 'package:dars_360/models/schedual_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Schedual extends StatefulWidget {
  @override
  _SchedualState createState() => _SchedualState();
}

class _SchedualState extends State<Schedual> {
  List<Data> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
    final response =
    await http.get("http://api.dars360.v3.com.darsint.arvixededicated.com/Student/ClassTimeTable/get?BranchID=1&IsoName=ar&StudentID=10029&Date=2019/10/10");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Data.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, i) {
            final x = _list[i];
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(x.dayName),

                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(x.period.periodName),
                  Text(x.period.startTime),
                  Text(x.period.endTime),
                  Text(x.period.subjectName),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Company",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
}