import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class createaAccount extends StatefulWidget {
  const createaAccount({super.key});

  @override
  State<createaAccount> createState() => _createaAccountState();
}

class _createaAccountState extends State<createaAccount> {

  final PageController _pagecontroller = PageController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller = TextEditingController();
  bool _isLoading = false;
  String ? _errorMessage;
  int _currentPage = 0;
  late Timer _timer;
  bool _isLogin = false;
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
      _namecontroller.dispose();
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
      _confirmpasswordcontroller.dispose();
      _timer.cancel();
      _pagecontroller.dispose();
      super.dispose();
    }

  Future<void> _handleSubmit() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
     try {
      if(_isLogin){
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );
        Navigator.pushReplacementNamed(context, '/home');
      }else {
        if(_passwordcontroller.text != _confirmpasswordcontroller.text) {
          setState(() => _errorMessage = "Passwords do not match");
          return;
        } 
        UserCredential cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text);
        await cred.user?.updateDisplayName(_namecontroller.text.trim());
        Navigator.pushReplacementNamed(context, '/home');
      }
     } on FirebaseAuthException catch (e) {
        setState(() {
          switch (e.code) {
            case 'user-not-found':
              _errorMessage = "No account found with this email.";
              break;
            case 'wrong-password':
              _errorMessage = "Incorrect password.";
              break;
            case 'email-already-in-use':
              _errorMessage = "This email is already registered.";
              break;
            case 'weak-password':
              _errorMessage = "Password must be at least 6 characters.";
              break;
            case 'invalid-email':
              _errorMessage = "Please enter a valid email.";
              break;
            default:
              _errorMessage = "Something went wrong. Try again.";
          }
        });
      } finally {
        setState(() => _isLoading = false);
      }
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
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                height: _isLogin 
                ? MediaQuery.of(context).size.height * 0.52 
                : MediaQuery.of(context).size.height * 0.73,  // ✅
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
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap:() => setState(() => _isLogin = false),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: !_isLogin ? Color(0xFF2D5A27) : Colors.transparent,
                                      width: 2.5,
                                    ),
                                  ),
                                ),
                                child: Text("Sign Up", style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: !_isLogin ? Color(0xFF2D5A27) : Colors.black54), textAlign: TextAlign.center),
                              )
                            )
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap:() => setState(() => _isLogin = true),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: _isLogin ? Color(0xFF2D5A27) : Colors.transparent,
                                      width: 2.5,
                                    ),
                                  ),
                                ),
                                child: Text("Login", style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: _isLogin ? Color(0xFF2D5A27) : Colors.black54), textAlign: TextAlign.center),
                              )
                            )
                          ),
                        ]
                      ),
                      
                      Expanded(
                         child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text(_isLogin ? "Welcome back!" : "Create an account", style: AppWidget.HeadlineTextStyle(20.0)),
                              SizedBox(height: 10,),
                              if(!_isLogin) ...[
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
                              ],
                              
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

                                if(!_isLogin) ...[
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
                                ],

                                
                                SizedBox(height: 30,),
                              Center(
                                child: SizedBox(
                                  width: 320,
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF2D5A27),
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
                                      ),
                                    ),
                                    child: Text(_isLogin ? "Login" : "Create Account", style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: Color.fromARGB(255, 255, 255, 255)),),
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
        ),     
    );
  }
}