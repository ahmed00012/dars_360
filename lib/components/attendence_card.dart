

import 'package:dars_360/models/attendence_model.dart';
import 'package:dars_360/models/note_model.dart';
import 'package:dars_360/models/student.dart';
import 'package:dars_360/webservice/webservice.dart';
import 'package:flutter/material.dart';

import 'package:dars_360/pages/studentnotes.dart';

class Attendence_card extends StatefulWidget {
  @override
  Attendence_cardState createState() => Attendence_cardState();
}

class Attendence_cardState extends State<Attendence_card> {
  List<Attendence_Model> attendence = List<Attendence_Model>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {

    Webservice().load(Attendence_Model.all).then((newsArticles) => {
      setState(() => {
        attendence = newsArticles
      })
    });

  }
  Card _buildItemsForListView(BuildContext context, int index) {
    return Card(
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              
            ],
          )
        ],

      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: attendence.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}




//class _ChildState extends State<Child> {
//

//}