import 'package:bloodbank/data_model.dart';
import 'package:bloodbank/login_as.dart';
import 'package:bloodbank/p_home_page1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'patient_login.dart';
import 'patient_request.dart';

class PatientHomePage extends StatefulWidget {
  String? _bloodGroup;
  PatientHomePage({required String bloodGroup}){
    this._bloodGroup = bloodGroup;
  }

  @override
  _PatientHomePageState createState() => _PatientHomePageState(_bloodGroup.toString());
}

class _PatientHomePageState extends State<PatientHomePage> {

  String? _name,_age,_bloodGroup;

  _PatientHomePageState(String bloodGroup){
    this._bloodGroup = bloodGroup;
  }
  
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String? _name,_bloodGroup,_age;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //  List<String> items=[
  //   "A+","B+","AB+","O+","A-","B-","AB-","O-"
  // ];
  
  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.red,
        //   child: Icon(Icons.logout),
        //   onPressed: ()async{
        //     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        //     setState(() {
        //       sharedPreferences.remove("id");
        //     });
        //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginAs()));
        //   },
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            // ignore: missing_return
                            validator: (input) {
                              if (input!.isEmpty) {
                                return "Please Enter Your name";
                              }
                              if (!input.contains(" ")) {
                                return "Please Enter Your Full Name";
                              }
                            },
                            onSaved: (input) => _name = input!,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(25)),
                              labelText: "Full Name",
                              labelStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
    
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            // ignore: missing_return
                            validator: (input) {
                              // int? age = int.tryParse(input.toString());
                              if (input!.isEmpty) {
                                return "Please Enter Your Age";
                              }
                              // if (age==null||age<0||age>80) {
                              //   return "Age Should be in Between 1 - 80";
                              // }
                            },
                            onSaved: (input) => _age = input,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(25)),
                                labelText: "Your Age",
                                labelStyle: TextStyle(color: Colors.red),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              // suffixIcon: IconButton(
                              //   icon: Icon(_obsecureText
                              //       ? Icons.visibility_off 
                              //       : Icons.visibility),
                              //       color: Colors.red,
                              //   onPressed: () {
                              //     setState(() {
                              //       _obsecureText = !_obsecureText;
                              //     });
                              //   },
                              // ),
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),

                //         Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text("Select Your Blood Group : ",style: TextStyle(fontSize: 18),),
                //Yaha se blood bank ka order request jayega?
                //ha
                //     DropdownButton<String>(
                //       value: _bloodGroup,
                //       items: items.map(buildMenuItem).toList(),
                //       onChanged: (value)=>setState(() {
                //         this._bloodGroup = value!;
                //       }),
                //     ),
                //   ],
                // ),
    
                        SizedBox(
                          height: 60,
                        ),
    
                        InkWell(
                          onTap: submit,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                          ),
                        ),

                        // InkWell(
                        //   onTap: (){
                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientRequest()));
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.all(10),
                        //     height: height * 0.07,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.red),
                        //         borderRadius: BorderRadius.circular(15)),
                        //     child: Center(
                        //         child: Text(
                        //       "View Approved Request",
                        //       style: TextStyle(
                                  
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20),
                        //     )),
                        //   ),
                        // ),
    
                        // InkWell(
                        //     child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 33,vertical: 7),
                        //     height: 30,
                        //     width: 110,
                        //     decoration: BoxDecoration(
                        //       color: Colors.blueGrey,
                        //       borderRadius: BorderRadius.circular(15)
                        //     ),
                        //     child:
                        //     Text("Sign In"),
                        //   ),
    
                        //   onTap: logIn,
    
                        // ),
                      ],
                    )),
          ],
        )
      ),
    );
  }

  DropdownMenuItem<String>buildMenuItem(String item)=>DropdownMenuItem(
      value: item,
      child: Text(
        item
      ),
    );

  Future<void> submit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save(); 
      saveName();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PatientHomePage1()));
      // if (_email == "admin@gmail.com" && _password == "password") {
      //   sharedPreferences.setString("id", "2");
      //model kaha hai
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => AdminHomePage()));
      // } else {
      // }
    }
  }
  void saveName(){
   // if(_age.!<=81)
    // String name = _name!;
    // String bloodGroup = _bloodGroup!;
    // String age = _age!;
    saveData(_name!, _bloodGroup!, _age!).then((bool committed){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Request Submitted",style: TextStyle(color: Colors.white),),
        ));
    });
  }

  Future<bool> saveData(String name,String bloodGroup,String age)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    DataModel dataModel = DataModel(name: name, bloodGroup: bloodGroup, age: age,status: false);

    ///This is to get all the request
    List<String>? allReq = await sharedPreferences.getStringList('req');
    if(allReq!=null){
      ///Convert string request to model
      List<DataModel> allModel = allReq.map((e) => DataModel.fromJson(e)).toList();
      allModel.add(dataModel);
      
      ///Replace the request list
      await sharedPreferences.setStringList('req', allModel.map((e) => e.toJson()).toList());
    }else{

      ///Add new element if there is no request already
      
      await sharedPreferences.setStringList('req', [dataModel].map((e) => e.toJson()).toList());
    }
    /* sharedPreferences.setString("name",name);

      sharedPreferences.setString("bloodGroup",bloodGroup);

      sharedPreferences.setString("age",age); */
      return sharedPreferences.commit();
  }

  

 

}