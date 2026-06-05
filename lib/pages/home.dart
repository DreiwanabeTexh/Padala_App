import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';
import 'package:padala_app/pages/order.dart';
import 'package:padala_app/pages/profile.dart';
import 'package:padala_app/pages/poster.dart';
import 'package:padala_app/pages/bottomnavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xff66785F), size: 28,),
                          Text("Current Location", style: AppWidget.SuperSimpleTextStyle()),
                        ],
                      ),
                      SizedBox(height: 2,),
                      Text("Lipa City, Batangas", style: AppWidget.HeadlineTextStyle(19.0)),
                    ],
                  ),
        
                ],
              ), 
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                height: MediaQuery.of(context).size.height/2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff66785F),
                ),
              child: Column(children: [
                  SizedBox(height: 35,),
                  Text("Track your Shipment", style: AppWidget.WhiteHeadlineTextStyle(21.0)),
                  SizedBox(height: 3,),
                  Text("Enter your tracking number below", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.white54).copyWith(fontSize: 17)),
                  SizedBox(height: 35,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Tracking Number",
                        hintStyle: AppWidget.HeadlineTextStyle(17.0),
                        prefixIcon: Icon(Icons.track_changes, color: Colors.red,),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      
                    )
                    
                  ),
                  Spacer(),
                  Image.asset('assets/images/home.png', height: 200,),
                  SizedBox(height: 1),
                ],),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(width: 5,),
                      Image.asset('assets/images/fast-delivery.png', height: 120,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          SizedBox(height: 13,),
                          Text("Order a Delivery", style: AppWidget.HeadlineTextStyle(21.0),),
                          SizedBox(height: 3,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: 
                            Text( "We'll pick up and deliver it across town quickly and securely", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 15), textAlign: TextAlign.center,),
                          )
                        ],),
                      )
                    ],)
                  )
                  
                )
              ), 
              SizedBox(height: 20,),
        
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(width: 5,),
                      Image.asset('assets/images/parcel.png', height: 120,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          SizedBox(height: 13,),
                          Text("Track a Delivery", style: AppWidget.HeadlineTextStyle(21.0),),
                          SizedBox(height: 3,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: 
                            Text( "Track your delivery in real time from pick up to drop off, anytime anywhere", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 15), textAlign: TextAlign.center,),
                          )
                        ],),
                      )
                    ],)
                  ),
        
                  
                  
                )
              ),
        
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(width: 5,),
                      Image.asset('assets/images/delivery-bike.png', height: 120,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          SizedBox(height: 14,),
                          Text("Check Delivery History", style: AppWidget.HeadlineTextStyle(20.0),),
                          SizedBox(height: 3,),
                          Container(
                            width: MediaQuery.of(context).size.width/1.9,
                            child: 
                            Text( "Check your delivery history anytime to view details and track your delivery", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 15), textAlign: TextAlign.center,),
                          )
                        ],),
                      )
                    ],)
                  )
                  
                )
              ), 
              SizedBox(height: 90,),
              
            ],
            
          )
        ),
      ),
    );
  }
}