

import 'package:dars_360/models/student.dart';
import 'package:dars_360/webservice/webservice.dart';
import 'package:flutter/material.dart';

import 'package:dars_360/pages/studentnotes.dart';

class Child extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  List<Student> students = List<Student>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {

    Webservice().load(Student.all).then((newsArticles) => {
      setState(() => {
       students = newsArticles
      })
    });

  }
  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      contentPadding:EdgeInsets.all(8),
      leading: Image.asset('images/boy.png'),
      title: Text(students[index].name, style: TextStyle(fontSize: 18)),
      subtitle: Text(students[index].grade + "            " + students[index].classname , style: TextStyle(fontSize: 18)),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentNotes()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: ListView.builder(
          itemCount: students.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}




//class _ChildState extends State<Child> {
//

//}