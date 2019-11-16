

import 'package:dars_360/models/note_model.dart';

import 'package:dars_360/webservice/webservice.dart';
import 'package:flutter/material.dart';



class Note_card extends StatefulWidget {
  @override
  _Note_cardState createState() => _Note_cardState();
}

class _Note_cardState extends State<Note_card> {
  List<Note> notes = List<Note>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {

    Webservice().load(Note.all).then((newsArticles) => {
      setState(() => {
        notes = newsArticles
      })
    });

  }
  Card _buildItemsForListView(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,



            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding:EdgeInsets.all(10),
                  child:  Text(notes[index].subjectName,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),

                Text(" - ",style: TextStyle(color:Colors.white),),
                Padding(padding: EdgeInsets.all(10),
                  child: Text(notes[index].periodName,textAlign: TextAlign.left,style: TextStyle(color: Colors.white)),)

              ],
            ),
          )
//          Text(notes[index].planList),

        ],
      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}




//class _ChildState extends State<Child> {
//

//}