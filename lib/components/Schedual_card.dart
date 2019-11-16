

import 'package:dars_360/models/schedual_model.dart';
import 'package:dars_360/models/student.dart';
import 'package:dars_360/webservice/webservice.dart';
import 'package:flutter/material.dart';

import 'package:dars_360/pages/studentnotes.dart';

class sc



class Schedual_card extends StatefulWidget {
  @override
  _Schedual_cardState createState() => _Schedual_cardState();
}

class _Schedual_cardState extends State<Schedual_card> {
  List<Data> schedual = List<Data>();
  List<PeriodList> period_list = List<PeriodList>();
  Data data =new Data( );



  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
   // _populatePeriodList();
  }

  void _populateNewsArticles() {

    Webservice().load(Data.all).then((newsArticles) => {
      setState(() => {
        schedual = newsArticles
      })
    });

  }
  void _populatePeriodList() {

    Webservice().load(PeriodList.all).then((newsArticles1) => {
      setState(() => {
        period_list = newsArticles1
      })
    });

  }
 Card _buildItemsForListView(BuildContext context, int index) {

    final x = schedual[index];
    return Card(


      child: Row(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
//period_list[index].subjectName

          Text(x.periodList,textAlign: TextAlign.left,
          style:TextStyle(color: Colors.lightGreenAccent),),
          Padding(padding: EdgeInsets.all(5)),
          Text(schedual[index].periodList[index].startTime,textAlign: TextAlign.center,
            style:TextStyle(color: Colors.lightGreenAccent),),
          Padding(padding: EdgeInsets.only(right: 7)),
          Text(schedual[index].periodList[index].endTime,
            style:TextStyle(color: Colors.lightGreenAccent),),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(schedual[index].periodList[index].periodName,textAlign: TextAlign.right,
            style:TextStyle(color: Colors.lightGreenAccent),),


        ],
      )



    ); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: schedual.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}




//class _ChildState extends State<Child> {
//

//}