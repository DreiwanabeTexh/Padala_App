import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart'; 

class Poster extends StatefulWidget {
  const Poster({super.key});

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff66785F),
      body: Container(
        margin: EdgeInsets.only(top: 40),  
        child: Column(children: [
          Center(child: Text("Add Package", style: AppWidget.WhiteHeadlineTextStyle(20.0), textAlign: TextAlign.center,)),
          SizedBox(height: 30,),  
          Expanded(
            
            child: Container(
              padding:EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 20,),
                  Center(child: Image.asset("assets/images/delivery-truck.png", height: 170, fit: BoxFit.cover,)),
                  SizedBox(height: 40,),
                  Text("Add Location", style: AppWidget.HeadlineTextStyle(20.0)),
                  SizedBox(height: 10,),
                  Text("Pick up", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter pick up location",
                      )
                    )
                  ),
                  SizedBox(height: 10,),
                  Text("Drop off", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter drop off location",
                      )
                    )
                  ),
                  SizedBox(height: 30,),
                  
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff66785F),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Submit Location", style: AppWidget.ButtonTextStyle().copyWith(fontSize: 19)),
                      )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 15,
                            right: 20,
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Pick-up Details", style: AppWidget.HeadlineTextStyle(20.0)),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Pick up address",
                              )
                            ),
                          ),
                          
                        
                        ]
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.person, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Username",
                              )
                            ),
                          ),
                          
                        
                        ]
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter phone number",
                              )
                            ),
                          ),
                          
                        
                        ]
                      )
                    ])
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 15,
                            right: 20,
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Drop-off Details", style: AppWidget.HeadlineTextStyle(20.0)),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Drop off address",
                              )
                            ),
                          ),
                          
                        
                        ]
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.person, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Username",
                              )
                            ),
                          ),
                          
                        
                        ]
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Color(0xff66785F)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter phone number",
                              )
                            ),
                          ),
                          
                        
                        ]
                      )
                    ])
                  ),
                  SizedBox(height: 30,),  
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                            top: 15,
                            left: 30,
                            bottom: 10
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1.5)
                    ),
                    child: Row(
                      children: [
                        Column(
                          
                          children: [
                            Text("Total Price", style: AppWidget.HeadlineTextStyle(19.0)),
                            Text("\₱600", style: AppWidget.HeadlineTextStyle(25.0).copyWith(color: Colors.red)),
                          ]
                        ),
                      SizedBox(width: 30,),
                        Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff4B5945),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Center(child: Text("Place order", style: AppWidget.ButtonTextStyle().copyWith(fontSize: 19))),
                        )
                      ]
                    )
                  ),
                  SizedBox(height: 85,),
                ],),
              ),
            ),
          )
        ])
      )
    );
  }
}