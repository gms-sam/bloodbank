import 'package:bloodbank/login_as.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'patient_login.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({ Key? key }) : super(key: key);

  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: ()async{
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          setState(() {
            sharedPreferences.remove("id");
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginAs()));
        },
      ),
      appBar: AppBar(title: Text("Home Page"),
      actions: [IconButton(onPressed: (){
        // AwesomeDialog(context: context,
        //   dialogType: DialogType.INFO,
        //    borderSide: BorderSide(color: Colors.green, width: 2),
        //               width: 280,
        //               buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        //               headerAnimationLoop: false,
        //               animType: AnimType.BOTTOMSLIDE,
        //               title: 'Company Info',
        //               desc: 'Company : Geeksynergy Technologies Pvt Ltd\nAddress : Sanjaynagar, Bengaluru-56\nPhone : ********09\nEmail : ********@gmail.com',
        //               showCloseIcon: true,
        // )..show();
      },icon: Icon(Icons.menu),)],
      ),
      body: Center(
        child: Text("welcome"),
      ),
    );
  }
}