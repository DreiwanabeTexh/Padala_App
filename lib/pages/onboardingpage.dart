import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';

class onboardingpage extends StatefulWidget {
  const onboardingpage({super.key});

  @override
  State<onboardingpage> createState() => _onboardingpageState();
}

class _onboardingpageState extends State<onboardingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(children: [
        Image.asset('assets/images/onboardd.png'),
        SizedBox(height: 20,),
        Text("Track your packages \n with ease", 
          textAlign: TextAlign.center, 
          style: AppWidget.HeadlineTextStyle(30.0)),
          SizedBox(height: 20,),
        Text("Check the progress of \n your deliveries", 
          textAlign: TextAlign.center, 
          style: AppWidget.SimpleTextStyle()),
          SizedBox(height: 35,),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: MediaQuery.of(context).size.width/1.7,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff4B5945),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Text("Track Now!",
                  textAlign: TextAlign.center, 
                  style: AppWidget.ButtonTextStyle()),
              ),
            ),
          ) 
      ],),),
    );
  }
}