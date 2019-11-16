import 'dart:convert';

import 'package:dars_360/webservice/webservice.dart';

class Attendence_Model {

  final String attendancePercent;
  final String excusePercent;
  final String withoutExcusePercent;

  Attendence_Model({this.attendancePercent, this.excusePercent, this.withoutExcusePercent});

  factory Attendence_Model.fromJson(Map<String,dynamic> json) {
    return Attendence_Model(
        attendancePercent: json['periodName'],
        excusePercent: json['subjectName'],
        withoutExcusePercent: json['planList']
    );
  }
  static Resource<List<Attendence_Model>> get all {

    return Resource(
        url: 'http://api.dars360.v3.com.darsint.arvixededicated.com/Student/Attendance/get?BranchID=1&IsoName=ar&StudentID=10029',
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['data'];
          return list.map((model) => Attendence_Model.fromJson(model)).toList();
        }
    );

  }
}