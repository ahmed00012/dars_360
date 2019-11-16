import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/classTimeTable_model.dart';

class ApiProvider{
  String ClassTimeTable = "http://api.dars360.v3.com.darsint.arvixededicated.com/Student/ClassTimeTable/get?BranchID=1&IsoName=ar&StudentID=10029&Date=2019/10/10";


  Future<List> getClassTimeTable() async{
    var response = await http.get(ClassTimeTable);
    var decoded = json.decode(response.body);
    List<ClassTimeTableModel> classTimeTableList = List<ClassTimeTableModel>();
    decoded['data']?.forEach((value) {
      classTimeTableList.add(ClassTimeTableModel.fromApi(value));
    });
    //print(decoded['data']);
    return classTimeTableList;
  }


}