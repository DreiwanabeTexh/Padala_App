import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';
import 'dart:async';

class createaAccount extends StatefulWidget {
  const createaAccount({super.key});

  @override
  State<createaAccount> createState() => _createaAccountState();
}

class _createaAccountState extends State<createaAccount> {

    final PageController _pagecontroller = PageController();
  int _currentPage = 0;
  late Timer _timer;
  final List<String> _pages = [
    "assets/images/tryt.png",
    "assets/images/tryt2.png",
    "assets/images/tryt3.png",
  ];

  @override
  void initState() {
    super.initState();
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
      _pagecontroller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B3A1A),
      body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,  // ✅
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
                      Text(
                        "Welcome to Padala App",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D5A27)
                        ),
                      ),
                      
                      Container(
                        width: double.infinity,
                         child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text("Create an account", style: AppWidget.HeadlineTextStyle(20.0)),
                              SizedBox(height: 10,),
                              Text("Fullname", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
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
                                      hintText: "Enter your fullname",
                                    )
                                  )
                                ),

                                SizedBox(height: 10,),
                              Text("Email address", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
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
                                      hintText: "Enter your Email address",
                                    )
                                  )
                                ),

                                SizedBox(height: 10,),
                              Text("Password", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
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
                                      hintText: "Enter your Password",
                                    )
                                  )
                                ),

                                SizedBox(height: 10,),
                              Text("Confirm Password", style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54).copyWith(fontSize: 19)),
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
                                      hintText: "Please confirm your Password",
                                    )
                                  )
                                ),
                                SizedBox(height: 30,),
                              Center(
                                child: SizedBox(
                                  width: 320,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {},
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
                              ),

                                

                            ]
                          )
                         )
                      )
                  ],
                ),
              ),
            ),
          ]
        )
      ,

      
    );
  }
}