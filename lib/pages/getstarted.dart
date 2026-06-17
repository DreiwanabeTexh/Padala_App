import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';
import 'dart:async';
import 'package:padala_app/pages/signin.dart';

class GetStarted extends StatefulWidget {

  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with TickerProviderStateMixin {

  final PageController _pagecontroller = PageController();
  int _currentPage = 0;
  late Timer _timer;
  final List<String> _pages = [
    "assets/images/tryt.png",
    "assets/images/tryt2.png",
    "assets/images/tryt3.png",
  ];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

  _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      if(_currentPage != _pages.length - 1){
        _currentPage++;
      }else{
        _currentPage = 0;
      }
      _pagecontroller.animateToPage(_currentPage, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

    @override
    void dispose() {
      _timer.cancel();
      _pagecontroller.dispose();
      _animationController.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B3A1A),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: PageView.builder(
                controller: _pagecontroller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_pages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:EdgeInsets.only(left: 20, right: 20, top: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                width: double.infinity,

                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_pages.length, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Color(0xFF2D5A27)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 15),

                    SizedBox(
                      width: 320,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _animationController.reset();
                            showModalBottomSheet(
                              context: context, 
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => createaAccount(isLogin: true),
                            );
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2D5A27),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        child: Text("Login", style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: Colors.white),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: 320,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _animationController.reset();
                            showModalBottomSheet(
                              context: context, 
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => createaAccount(isLogin: false),
                            );
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 253, 253, 253),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Color(0xFF2D5A27), width: 2),
                          ),
                        ),
                        child: Text("Create Account", style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: Color(0xFF2D5A27)),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("By continuing, you agree to Padala's", style: AppWidget.HeadlineTextStyle(13.0).copyWith(color: const Color.fromARGB(255, 0, 0, 0)),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Privacy Policy Clicked")),
                            );
                          },
                        child: Text("Privacy Policy", style: TextStyle(
                          color: Color(0xFF2D5A27),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),),
                        ),
                        Text(" and ", style: AppWidget.HeadlineTextStyle(13.0).copyWith(color: const Color.fromARGB(255, 0, 0, 0)),),
                          GestureDetector(
                            onTap: () => {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Terms of Use Clicked")),
                              )
                            },
                            child: Text("Terms of Use",
                              style: TextStyle(
                                color: Color(0xFF2D5A27),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ]
                    )
                  ]
                ),
              ),
            ),
          ]
        )
      ),

      
    );
  }
}