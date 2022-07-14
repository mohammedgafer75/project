import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'main.dart';


class SplashDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _SplashDemo();
  }
}

class _SplashDemo extends State<SplashDemo> {

  String language = "";
  @override
  void initState() {
    super.initState();
    const duration = Duration(milliseconds: 9000);

     Timer(duration, () {
      // prefix0.Navigator.of(context).pop();
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  Scaffold(
      body:  Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                        children: [
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[

                               // new Icon(Icons.access_time,size: 120,),
                               SizedBox(

                                   child: Image.asset("assets/index.jpg",
                                     height: 200,
                                     width: 200,),

                                 ),


                               // LinearProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),backgroundColor: Colors.black,),
                               const Padding(
                                 padding: EdgeInsets.only(top: 20),
                               ),
                               const Text("تطبيق موبايل لخدمات الطلاب الجامعية",style: TextStyle(color: const Color(0xFF191970),fontSize: 22,fontWeight: FontWeight.bold),),
                               Column(
                                 children: [


                                   Container(
                                     decoration: const BoxDecoration(
                                       gradient:  LinearGradient(
                                           begin: Alignment.centerLeft,
                                           end: Alignment.centerRight,
                                           colors: [
                                             Colors.white10,
                                             Colors.white10
                                           ]),
                                       borderRadius:
                                        BorderRadius.all( Radius.circular(10.0)),
                                     ),

                                   ),

                                 ],
                               ),
                             ],
                           )

                /////////////////////////////////////////////////
             ] )]),
    ) );
  }
}
