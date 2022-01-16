import 'dart:async';

import 'package:bloodbank/admin_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({ Key? key }) : super(key: key);

  @override
  State<AdminRequestPage> createState() => _AdminRequestPageState();
}

class _AdminRequestPageState extends State<AdminRequestPage> {
  String? _name,_bloodGroup,_age;
  @override
  void initState(){
    // TODO: implement initState
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // _name = sharedPreferences.getString("name");
    // _age = sharedPreferences.getString("age");
    // _bloodGroup = sharedPreferences.getString("bloodGroup");
    setState(() {
      getData().then(updateName);
     getData1().then(updateName1);
      getData2().then(updateName2);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
             _bloodGroup == "A+"||_bloodGroup=="B+"||_bloodGroup=="AB+"||_bloodGroup=="A-"||_bloodGroup=="B-"||_bloodGroup=="AB-"||_bloodGroup=="O+"||_bloodGroup=="O-"? 
             Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(15)
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : $_name",style: TextStyle(fontSize: 30,  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Blood Group : $_bloodGroup",style: TextStyle(fontSize: 30,),),
                    Text("Age : $_age",style: TextStyle(fontSize: 30,  ),),
                    
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green
                      ),
                      child: Text("Accept"),
                      onPressed: ()async{
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.remove("name");
                        sharedPreferences.remove("age");
                        sharedPreferences.remove("bloodGroup");
                        sharedPreferences.setString("name1", _name!);
                        sharedPreferences.setString("age1", _age!);
                        sharedPreferences.setString("bloodGroup1", _bloodGroup!);
                         sharedPreferences.setString("status", "Accepted");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                      },),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red
                      ),
                      child: Text("Decline"),
                      onPressed: ()async{
                         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.remove("name");
                        sharedPreferences.remove("age");
                        sharedPreferences.remove("bloodGroup");
                        sharedPreferences.setString("status", "Declined");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                      }, ),
                  ],
                )
                  ],
                ),
              ):
             Center(child: Text("No Request"),)
            ],
          ),
        ),
      ),
    );
  }

  

   Future<String> getData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString("name");
    return name.toString();
  }
   Future<String> getData1()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? bloodGroup = sharedPreferences.getString("bloodGroup");
    return bloodGroup.toString();
  }
   Future<String> getData2()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? age = sharedPreferences.getString("age");
    return age.toString();
  }


  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }

  void updateName1(String bloodGroup) {
    setState(() {
      this._bloodGroup = bloodGroup;
    });
  }

  void updateName2(String age) {
    setState(() {
      this._age = age;
    });
  }
}