import 'package:flutter/material.dart';
class Attendence extends StatefulWidget {
  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("الحضور والغياب"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
