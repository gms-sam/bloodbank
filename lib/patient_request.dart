import 'dart:async';

import 'package:bloodbank/patient_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientRequest extends StatefulWidget {
  const PatientRequest({ Key? key }) : super(key: key);

  @override
  State<PatientRequest> createState() => _PatientRequestState();
}

class _PatientRequestState extends State<PatientRequest> {
  String? _name1,_bloodGroup1,_age1,_status;

  void initState(){
    // TODO: implement initState
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // _name = sharedPreferences.getString("name");
    // _age = sharedPreferences.getString("age");
    // _bloodGroup = sharedPreferences.getString("bloodGroup");
    getData().then(updateName);
     getData1().then(updateName1);
      getData2().then(updateName2);
      getData3().then(updateName3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
             if(_status == null||_name1 == null||_age1 == null||_bloodGroup1 == null)
              Center(child: Text("No request"),)
              else
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
                    Text("Name : $_name1",style: TextStyle(fontSize: 30,  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Blood Group : $_bloodGroup1",style: TextStyle(fontSize: 30,),),
                    Text("Age : $_age1",style: TextStyle(fontSize: 30,  ),),
                    
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Your Request is : $_status",style: TextStyle(fontSize: 20),),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red
                      ),
                      child: Icon(Icons.delete),
                      onPressed: ()async{
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.remove("name1");
                        sharedPreferences.remove("age1");
                        sharedPreferences.remove("bloodGroup1");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientHomePage()));
                      },),
                  ],
                )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   Future<String> getData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString("name1");
    return name.toString();
  }
   Future<String> getData1()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? bloodGroup = sharedPreferences.getString("bloodGroup1");
    return bloodGroup.toString();
  }
   Future<String> getData2()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? age = sharedPreferences.getString("age1");
    return age.toString();
  }

  Future<String> getData3()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? status = sharedPreferences.getString("status");
    return status.toString();
  }


  void updateName(String name) {
    setState(() {
      this._name1 = name;
    });
  }

  void updateName1(String bloodGroup) {
    setState(() {
      this._bloodGroup1 = bloodGroup;
    });
  }

  void updateName2(String age) {
    setState(() {
      this._age1 = age;
    });
  }
  void updateName3(String status){
    setState(() {
      this._status = status;
    });
  }
}