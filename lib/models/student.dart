import 'dart:convert';

import 'package:dars_360/webservice/webservice.dart';

class Student {

  final String name;
  final String grade;
  final String classname;

  Student({this.name, this.grade, this.classname});

  factory Student.fromJson(Map<String,dynamic> json) {
    return Student(
        name: json['name'],
        grade: json['gradeName'],
        classname: json['className']
    );
  }
  static Resource<List<Student>> get all {

    return Resource(
        url: 'http://api.dars360.v3.com.darsint.arvixededicated.com/Parent/Children/get?BranchID=1&IsoName=ar&UserID=10110',
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['data'];
          return list.map((model) => Student.fromJson(model)).toList();
        }
    );

  }
}