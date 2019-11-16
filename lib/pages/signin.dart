import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'children.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn>
{
//  Login(String username,password) async{
////  Map data={
////    "UserName":"parent02",
////    "Password":"12345"
////  };
//    var data= jsonEncode( {
//      'username': 'parent02',
//      'password': '12345'
//    });
//
//    var JsonData=null;
//    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//    var response=
//    await http.post("http://api.dars360.v3.com.darsint.arvixededicated.com/Parent/Account/Login",
//        body: data);
//
//
//    if(response.statusCode==200){
//      JsonData=json.decode(response.body);
//      setState(() {
//        sharedPreferences.setString("token",JsonData['token']);
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Children()), (Route<dynamic> route)=> false);
//
//      });
//    }
//    else{
//      print(response.body);
//    }
//
//  }
login(String email1,password1) async{
  String url =
      'http://api.dars360.v3.com.darsint.arvixededicated.com/Parent/Account/Login';
  Map map = {
    "UserName":email1,
    "Password":password1
  };
  print(await apiRequest(url, map));

}

  Future<String> apiRequest(String url, Map map) async {

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));

    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    if(response.statusCode==200){
//      JsonData=json.decode(response.body);
      setState(() {
//        sharedPreferences.setString("token",JsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Children(text: email.text,)), (Route<dynamic> route)=> false);

      });
    }
    else{
      print(reply);
    }

    httpClient.close();
    return reply;
  }

  TextEditingController email =new TextEditingController();
  TextEditingController password = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 250,
              color: Colors.grey[200],

              child: Container(
                height: 300,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black54)),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 1),
                      height: 100,
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white.withOpacity(0.8),
                        child: TextFormField(
                          textAlign: TextAlign.center,

                          keyboardType: TextInputType.emailAddress,
                          controller: email,



                          decoration: new InputDecoration.collapsed(
                              hintText: "اسم المستخدم",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                      height: 80,
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white.withOpacity(0.8),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: password,


                          obscureText: true,


                          decoration: new InputDecoration.collapsed(
                              hintText: "كلمة السر",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton(onPressed: ()  {

                      login(email.text, password.text);
                      },
                        color: Colors.blue[900],
                        child: Text("تسجيل الدخول",textAlign: TextAlign.center,style: TextStyle(color: Colors.white , fontWeight: FontWeight.w200),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 260),
                  child: Image.asset(
                    'images/dars_logo.png',
                    width: 100,
                    height: 90,
                  ),
                ),
              ),
            ),
            ]
        ),

            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 90)),
                  Text("منصة درس السحابية" ,
                    style: TextStyle(color: Colors.blue[900],
                        fontWeight: FontWeight.w800,
                        fontSize: 20),),
                  Text("الاصدار الثالث" ,
                    style: TextStyle(color: Colors.lightGreenAccent[400],
                        fontWeight: FontWeight.w600,
                        fontSize: 20),)
                ],
              ),
            )
          ],
        ));
  }


  }

