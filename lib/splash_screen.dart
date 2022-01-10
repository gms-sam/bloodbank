import 'dart:async';
import 'package:bloodbank/login_as.dart';
import 'package:bloodbank/patient_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_home_page.dart';
import 'patient_home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String? finalId;


  void startTimer()async{
   getValidationData().whenComplete(()async{
      Timer(Duration(seconds: 5),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
     finalId=="1"?PatientHomePage():finalId=="2"?AdminHomePage():LoginAs()
     ));
    } );
   });
  }

  Future getValidationData()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? obtainedId = sharedPreferences.getString("id");
    setState(() {
      finalId = obtainedId;
    });
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {  
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
             height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyFa4AjmU3IHfN-fIJ9IR208KsMWjO6cxlhamYTDrUfX5MQ7SYOBmW_cu7qguE_cmuFVo&usqp=CAU',fit: BoxFit.contain,),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.red.withOpacity(1),
              Colors.deepOrange.withOpacity(0.4)
            ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
             height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}