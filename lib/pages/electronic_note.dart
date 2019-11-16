import 'package:dars_360/components/note_card.dart';
import 'package:dars_360/models/note_model.dart';
import 'package:flutter/material.dart';
class ElectronicNote extends StatefulWidget {
  @override
  _ElectronicNoteState createState() => _ElectronicNoteState();
}

class _ElectronicNoteState extends State<ElectronicNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("النوتة الاليكترونية"),
        centerTitle: true,
      ),
      body: Container(child:Note_card(),),

    );
  }
}
