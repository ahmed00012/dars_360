import 'package:dars_360/components/children_card.dart';
import 'package:flutter/material.dart';


class Children extends StatefulWidget {
  final String text;
  Children({ @required this.text}) ;
  @override
  _ChildrenState createState() => _ChildrenState(text: text);
}

class _ChildrenState extends State<Children> {
  final String text;
  _ChildrenState({ this.text}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text( text + " مرحبا"),
        centerTitle: true,
      ),
      body: new Container(

         child: Child(),



      ),

    );
  }
}
