import 'package:dars_360/pages/schedual.dart';
import 'package:flutter/material.dart';

import 'package:dars_360/pages/attendence.dart';
import 'electronic_note.dart';


class StudentNotes extends StatefulWidget {
  @override
  _StudentNotesState createState() => _StudentNotesState();
}

class _StudentNotesState extends State<StudentNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],

      ),

        body:Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            InkWell(
            child:Padding(padding: EdgeInsets.all(8),child: Container(
      height: 100,
      width: 300,
      alignment: Alignment.center,
      padding:  EdgeInsets.all(8),
      color: Colors.redAccent,
      child: Text("تهيب المدرسة بجميع أولياء الامور الالتزام بمواعيد الحضور والانصراف" ,
        style: TextStyle(fontWeight:FontWeight.w500 , fontSize: 15 , color: Colors.white),textAlign: TextAlign.center,
      ),
    ),),
        ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Attendence()));
              },
        child: Padding(padding: EdgeInsets.all(8),child: Container(
        height: 70,
        width: 100,
        alignment: Alignment.center,
        padding:  EdgeInsets.all(8),
        color: Colors.blue,
        child: Text("الحضور والغياب" ,
        style: TextStyle(fontWeight:FontWeight.w500 , fontSize: 15 , color: Colors.white),
        ),
        ),
    ),
        ),
            InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectronicNote()));
    },
    child:  Padding(padding: EdgeInsets.all(8),child: Container(
    height: 70,
    width: 100,
    alignment: Alignment.center,
    padding:  EdgeInsets.all(8),
    color: Colors.blue,
    child: Text("النوتة الالكترونية" ,
    style: TextStyle(fontWeight:FontWeight.w500 , fontSize: 15 , color: Colors.white),
    ),
    ),),
    ),
           InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Schedual()));
             },
             child:  Padding(padding: EdgeInsets.all(8),child: Container(
               height: 70,
               width: 100,
               alignment: Alignment.center,
               padding:  EdgeInsets.all(8),
               color: Colors.blue,
               child: Text("جدول الحصص" ,
                 style: TextStyle(fontWeight:FontWeight.w500 , fontSize: 15 , color: Colors.white),
               ),
             ),),
           )
          ],
        )
    );

  }
}
