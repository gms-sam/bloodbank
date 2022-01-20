import 'package:bloodbank/login_as.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_request_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({ Key? key }) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int? _count1 = 3,_count2=2,_count3=1,_count4=0,_count5=5,_count6=4,_count7=9,_count8=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1();
    getData2();
    getData3();
    getData4();
    getData5();
    getData6();
    getData7();
    getData8();
  }
  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  Future<Null>getData1()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count1")??0;

   setState(() {
     _count1 = data;
   });
  }

  Future<Null>incre1()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count1 = _count1!+1;
      sharedPreferences.setInt("count1", _count1!);
    });
  }

  Future<Null>decre1()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count1 = _count1!-1;
      sharedPreferences.setInt("count1", _count1!);
    });
  }


  Future<Null>getData2()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count2")??0;

   setState(() {
     _count2 = data;
   });
  }

  Future<Null>incre2()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count2 = _count2!+1;
      sharedPreferences.setInt("count2", _count2!);
    });
  }

  Future<Null>decre2()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count2 = _count2!-1;
      sharedPreferences.setInt("count2", _count2!);
    });
  }

  Future<Null>getData3()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count3")??0;

   setState(() {
     _count3 = data;
   });
  }

  Future<Null>incre3()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count3 = _count3!+1;
      sharedPreferences.setInt("count3", _count3!);
    });
  }

  Future<Null>decre3()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count3 = _count3!-1;
      sharedPreferences.setInt("count3", _count3!);
    });
  }

  Future<Null>getData4()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count4")??0;

   setState(() {
     _count4 = data;
   });
  }

  Future<Null>incre4()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count4 = _count4!+1;
      sharedPreferences.setInt("count4", _count4!);
    });
  }

  Future<Null>decre4()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count4 = _count4!-1;
      sharedPreferences.setInt("count4", _count4!);
    });
  }

  Future<Null>getData5()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count5")??0;

   setState(() {
     _count5 = data;
   });
  }

  Future<Null>incre5()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count5 = _count5!+1;
      sharedPreferences.setInt("count5", _count5!);
    });
  }

  Future<Null>decre5()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count5 = _count5!-1;
      sharedPreferences.setInt("count5", _count5!);
    });
  }

  Future<Null>getData6()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count6")??0;

   setState(() {
     _count6 = data;
   });
  }

  Future<Null>incre6()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count6 = _count6!+1;
      sharedPreferences.setInt("count6", _count6!);
    });
  }

  Future<Null>decre6()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count6 = _count6!-1;
      sharedPreferences.setInt("count6", _count6!);
    });
  }

  Future<Null>getData7()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count7")??0;

   setState(() {
     _count7 = data;
   });
  }

  Future<Null>incre7()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count7 = _count7!+1;
      sharedPreferences.setInt("count7", _count7!);
    });
  }

  Future<Null>decre7()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count7 = _count7!-1;
      sharedPreferences.setInt("count7", _count7!);
    });
  }

  Future<Null>getData8()async{
    final SharedPreferences sharedPreferences = await pref;
   int data = sharedPreferences.getInt("count8")??0;

   setState(() {
     _count8 = data;
   });
  }

  Future<Null>incre8()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count8 = _count8!+1;
      sharedPreferences.setInt("count8", _count8!);
    });
  }

  Future<Null>decre8()async{
    final SharedPreferences sharedPreferences = await pref;
    // ignore: unnecessary_this
    this.setState(() {
      _count8 = _count8!-1;
      sharedPreferences.setInt("count8", _count8!);
    });
  }

  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count1==0?_count1:decre1();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count1.toString()),
                    IconButton(onPressed: (){
                      incre1();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/a+.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                  Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count2==0?_count2:decre2();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count2.toString()),
                    IconButton(onPressed: (){
                      incre2();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/b+.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count3==0?_count3:decre3();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count3.toString()),
                    IconButton(onPressed: (){
                      incre3();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/ab+.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count4==0?_count4:decre4();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count4.toString()),
                    IconButton(onPressed: (){
                      incre4();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/o+.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count5==0?_count5:decre5();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count5.toString()),
                    IconButton(onPressed: (){
                      incre5();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/a-.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count6==0?_count6:decre6();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count6.toString()),
                    IconButton(onPressed: (){
                      incre6();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/b-.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count7==0?_count7:decre7();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count7.toString()),
                    IconButton(onPressed: (){
                      incre7();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/ab-.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: width/2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        _count8==0?_count8:decre8();
                      }, icon: Icon(Icons.minimize_sharp)),
                      Text(_count8.toString()),
                    IconButton(onPressed: (){
                      incre8();
                    }, icon: Icon(Icons.add)),
                    Stack(children: [
                      Image.asset("assets/o-.png",height: 50,),
                    ],) 
                    ],
                  ),
                ),
              ],
            ),

            // Wrap(
            //   children: [
            //     customContainer(context,03,"A+",()=>PatientHomePage(bloodGroup: "A+",)),
            //     customContainer(context,01,"B+",()=>PatientHomePage(bloodGroup: "B+",)),
            //     customContainer(context,00,"O+",()=>PatientHomePage(bloodGroup: "O+")),
            //     customContainer(context,05,"AB+",()=>PatientHomePage(bloodGroup: "AB+",)),
            //     customContainer(context,03,"A-",()=>PatientHomePage(bloodGroup: "A-",)),
            //     customContainer(context,05,"B-",()=>PatientHomePage(bloodGroup: "B-",)),
            //     customContainer(context,01,"O-",()=>PatientHomePage(bloodGroup: "O-",)),
            //     customContainer(context,02,"AB-",()=>PatientHomePage(bloodGroup: "AB-",)),
            //   ],
            // ),
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

  // InkWell customContainer(BuildContext context,int quantity,String bloodGroup,Widget Function() className) {
  //   int _quantity = quantity;
  //   return InkWell(
  //     onTap: (){
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>className()));
  //     },
  //     child: Container(
  //                 width: MediaQuery.of(context).size.width/2.5,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(15),
  //                   border: Border.all(color: Colors.red)
  //                 ),
  //                 margin: EdgeInsets.only(left: 10,top: 30,bottom: 10,right: 10),
  //                // padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
  //                 child: Row(
  //                   children: [
  //                     IconButton(onPressed: (){
  //                       setState(() {
  //                         _quantity != 0 ? _quantity--:_quantity;
  //                       });
  //                     }, icon: Icon(Icons.minimize)),
  //                     Text(_quantity.toString()),
  //                     IconButton(onPressed: (){}, icon: Icon(Icons.add)),
  //                    // SizedBox(width: 40,),
  //                     Text(bloodGroup,style: TextStyle(fontSize: 20),),
  //                  //   Image.asset("assets/blood.png",height: 50,) 
  //                   ],
  //                 ),
  //               ),
  //   );
  // }
}