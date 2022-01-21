import 'dart:async';

import 'package:bloodbank/admin_home_page.dart';
import 'package:bloodbank/data_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({Key? key}) : super(key: key);

  @override
  State<AdminRequestPage> createState() => _AdminRequestPageState();
}

class _AdminRequestPageState extends State<AdminRequestPage> {
  String? _name, _bloodGroup, _age;
  @override
  void initState() {
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

  Future<List<DataModel>> getDataModel() async {
    var instance = await SharedPreferences.getInstance();
    var list = instance.getStringList('req');
    if (list != null) {
      return list.map((e) => DataModel.fromJson(e)).toList();
    } else {
      return Future.error("Data is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<DataModel>>(
                      future: getDataModel(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final list = snapshot.data!;
                        
                        return Column(
                          children: list.map((e) => Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        child: Text("Accept"),
                                        onPressed: () async {
                                          e= e.copyWith(age: e.age, name: e.name, status: true, bloodGroup: e.bloodGroup);
                                          SharedPreferences sharedPreferences =
                                              await SharedPreferences.getInstance();
                                          //sharedPreferences.setStringList('req', )
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminHomePage()));
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        child: Text("Decline"),
                                        onPressed: () async {
                                          SharedPreferences sharedPreferences =
                                              await SharedPreferences.getInstance();
                                          sharedPreferences.remove("name");
                                          sharedPreferences.remove("age");
                                          sharedPreferences.remove("bloodGroup");
                                          sharedPreferences.setString(
                                              "status", "Declined");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminHomePage()));
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),).toList()
                        );
                      })
                  
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? name = sharedPreferences.getString("name");
    return name.toString();
  }

  Future<String> getData1() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? bloodGroup = sharedPreferences.getString("bloodGroup");
    return bloodGroup.toString();
  }

  Future<String> getData2() async {
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
