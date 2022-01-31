import 'dart:async';

import 'package:bloodbank/p_home_page1.dart';
import 'package:bloodbank/patient_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_model.dart';

class PatientRequest extends StatefulWidget {
  const PatientRequest({ Key? key }) : super(key: key);

  @override
  State<PatientRequest> createState() => _PatientRequestState();
}

class _PatientRequestState extends State<PatientRequest> {
  String? _name1,_bloodGroup1,_age1,_status;

  List<DataModel> dataModel = [];

  Future<List<DataModel>> getDataModel() async {
    var instance = await SharedPreferences.getInstance();
    var list = instance.getStringList('pateint');
    if (list != null) {
      dataModel = list.map((e) => DataModel.fromJson(e)).toList();
      return dataModel;
    } else {
      return Future.error("Data is null");
    }
  }

  // void initState(){
  //   // TODO: implement initState
  //   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // _name = sharedPreferences.getString("name");
  //   // _age = sharedPreferences.getString("age");
  //   // _bloodGroup = sharedPreferences.getString("bloodGroup");
  //  setState(() {
  //     getData().then(updateName);
  //    getData1().then(updateName1);
  //     getData2().then(updateName2);
  //     getData3().then(updateName3);
  //  });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder<List<DataModel>>(
              future: getDataModel(),
              builder: (context, snapshot) {
                if (snapshot.data!=null&&snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Request"),
                  );
                }
                final list = dataModel;

                return Column(
                    children: list
                        .map(
                          (e) => Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : ${e.name}",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Blood Group : ${e.bloodGroup}",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      "Age : ${e.age}",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      child: Icon(Icons.delete),
                                      onPressed: () async {
                                        SharedPreferences
                                            sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        List<DataModel> newData = list;
                                        newData.remove(e);
                                        // List<String>? data2 =
                                        //     sharedPreferences
                                        //         .getStringList('pateint');
                                        // List<DataModel> patientData = [];
                                        // if (data2 != null) {
                                        //   patientData = data2
                                        //       .map((e) =>
                                        //           DataModel.fromJson(e))
                                        //       .toList();
                                        //   // patientData.add(e.copyWith(
                                        //   //     age: e.age,
                                        //   //     name: e.name,
                                        //   //     status: false,
                                        //   //     bloodGroup: e.bloodGroup));
                                        // } else {
                                        //   patientData.add(e.copyWith(
                                        //       age: e.age,
                                        //       name: e.name,
                                        //       status: false,
                                        //       bloodGroup: e.bloodGroup));
                                        // }
                                        //e= e.copyWith(age: e.age, name: e.name, status: true, bloodGroup: e.bloodGroup);

                                        sharedPreferences.setStringList(
                                            'pateint',
                                            newData
                                                .map((e) => e.toJson())
                                                .toList());
                                        // sharedPreferences.setStringList(
                                        //     'req',
                                        //     newData
                                        //         .map((e) => e.toJson())
                                        //         .toList());
                                        await getDataModel();
                                        setState(() {});
                                        Navigator.pop(context);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PatientHomePage1()));
                                      },
                                    ),
                                    e.status==true?Text("Your request is Accepted",style: TextStyle(fontSize: 20),):Text("Your Request is Rejected",style: TextStyle(fontSize: 20),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        .toList());
              }),
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