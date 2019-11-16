
import 'package:dars_360/pages/schedual.dart';
import 'package:dars_360/pages/splashscreen.dart';
import 'package:flutter/material.dart';

import 'ApiProvider.dart';
import 'models/classTimeTable_model.dart';


void main() => runApp(MyApp(

));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:SplashScreen(),
    );
  }
}
