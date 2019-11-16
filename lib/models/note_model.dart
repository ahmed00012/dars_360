import 'dart:convert';

import 'package:dars_360/webservice/webservice.dart';

class Note {

  final String periodName;
  final String subjectName;
  final  planList ;

  Note({this.periodName, this.subjectName, this.planList});

  factory Note.fromJson(Map<String,dynamic> json) {
    return Note(
        periodName: json['periodName'],
        subjectName: json['subjectName'],
        planList: json['planList']
    );
  }
  static Resource<List<Note>> get all {

    return Resource(
        url: 'http://api.dars360.v3.com.darsint.arvixededicated.com/Student/NoteBook/get?BranchID=1&IsoName=ar&StudentID=10029&Date=2019/10/10',
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['data'];
          return list.map((model) => Note.fromJson(model)).toList();
        }
    );

  }
}