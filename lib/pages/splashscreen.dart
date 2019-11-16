import 'dart:async';

import 'package:dars_360/pages/signin.dart';
import 'package:flutter/material.dart';





class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}
class _SplashScreen extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
           decoration: BoxDecoration(color: Colors.white),

          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/dars.png',
                    height: 200,
                    width: 400,)


                  ],
                ),
              )
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }


}

