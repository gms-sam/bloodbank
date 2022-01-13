import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'patient_home_page.dart';

class PatientLoginPage extends StatefulWidget {
  const PatientLoginPage({Key? key}) : super(key: key);

  @override
  State<PatientLoginPage> createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  bool _obsecureText = true;
  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                height: height * 0.053,
                width: height * 1,
                child: Text(
                  'Patient Login',
                  style: TextStyle(
                      // color: lightGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                height: height * 0.3,
                width: width * 1,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
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
                              return "Please Enter a Email";
                            }
                            if (!input.endsWith("@gmail.com")) {
                              return "Email Should end with @gmail.com";
                            }
                          },
                          onSaved: (input) => _email = input!,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(25)),
                            labelText: "Email",
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
                          // ignore: missing_return
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please Enter a password";
                            }
                            if (input.length < 6) {
                              return "Your Password must be atleast 6 character";
                            }
                          },
                          onSaved: (input) => _password = input!,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(25)),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            suffixIcon: IconButton(
                              icon: Icon(_obsecureText
                                  ? Icons.visibility_off 
                                  : Icons.visibility),
                                  color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                            ),
                            prefixIcon: Icon(
                              Icons.code,
                              color: Colors.red,
                            ),
                          ),
                          obscureText: _obsecureText,
                        ),
                      ),

                      SizedBox(
                        height: 60,
                      ),

                      InkWell(
                        onTap: logIn,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                //color: lightGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),

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
          ),
        ),
      ),
    );
  }

  Future<void> logIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      // String? newEmail = sharedPreferences.getString("email");
      // String? newPassword = sharedPreferences.getString("password");
      if (_email == "email@gmail.com" && _password == "password") {
        sharedPreferences.setString("id", "1");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PatientHomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid credential"),
        ));
      }
    }
  }
}
