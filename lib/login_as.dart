import 'package:bloodbank/admin_home_page.dart';
import 'package:bloodbank/admin_login.dart';
import 'package:bloodbank/patient_login.dart';
import 'package:flutter/material.dart';

class LoginAs extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              height: height * 0.053,
              width: height * 1,
              child: Text(
                'Blood Bank',
                style: TextStyle(
                   // color: lightGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
             margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: height * 0.3,
              width: width * 1,
             child: Image.network("https://www.seekpng.com/png/detail/251-2517178_blood-logo-www-blood-donation-png-logo.png",fit: BoxFit.contain,),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: height * 0.10,
              width: width * 1,
              child: Text(
                'Login As',
                style: TextStyle(
                    //color: lightGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: height*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text("Admin",style: TextStyle(
                        //color: lightGrey,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),)),
                ),
              ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PatientLoginPage()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: height*0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red,width: 2),
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text("Patient",style: TextStyle(
                      //color: lightGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}