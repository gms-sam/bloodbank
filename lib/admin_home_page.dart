import 'package:bloodbank/login_as.dart';
import 'package:bloodbank/patient_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_request_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({ Key? key }) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.logout),
          onPressed: ()async{
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          setState(() {
            sharedPreferences.remove("id");
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginAs()));
          },
        ),
        body: Column(
         //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              height: height * 0.053,
              width: width * 1,
              child: Text(
                'Available Blood per group in Liters',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Wrap(
              children: [
                customContainer(context,"03","A+",()=>PatientHomePage(bloodGroup: "A+",)),
                customContainer(context,"01","B+",()=>PatientHomePage(bloodGroup: "B+",)),
                customContainer(context,"00","O+",()=>PatientHomePage(bloodGroup: "O+")),
                customContainer(context,"05","AB+",()=>PatientHomePage(bloodGroup: "AB+",)),
                customContainer(context,"03","A-",()=>PatientHomePage(bloodGroup: "A-",)),
                customContainer(context,"05","B-",()=>PatientHomePage(bloodGroup: "B-",)),
                customContainer(context,"01","O-",()=>PatientHomePage(bloodGroup: "O-",)),
                customContainer(context,"02","AB-",()=>PatientHomePage(bloodGroup: "AB-",)),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminRequestPage()));
              },
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("todays Request",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    Icon(Icons.navigate_next,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  InkWell customContainer(BuildContext context,String quantity,String bloodGroup,Widget Function() className) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>className()));
      },
      child: Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red)
                  ),
                  margin: EdgeInsets.only(left: 10,top: 30,bottom: 10,right: 10),
                  padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Text(quantity,style: TextStyle(fontSize: 20),),
                      SizedBox(width: 40,),
                      Text(bloodGroup,style: TextStyle(fontSize: 20),),
                      Image.network("https://image.pngaaa.com/330/741330-middle.png",height: 50,) 
                    ],
                  ),
                ),
    );
  }
}