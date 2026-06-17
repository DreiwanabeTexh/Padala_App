import 'package:flutter/material.dart';
import 'package:padala_app/service/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createaAccount extends StatefulWidget {
  final bool isLogin;
  const createaAccount({super.key, this.isLogin = false});

  @override
  State<createaAccount> createState() => _createaAccountState();
}

class _createaAccountState extends State<createaAccount> {

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text,
        );
        print("LOGIN SUCCESS");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (_passwordcontroller.text != _confirmpasswordcontroller.text) {
          setState(() => _errorMessage = "Passwords do not match");
          return;
        }
        UserCredential cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text,
        );
        print("SIGNUP SUCCESS");
        await cred.user?.updateDisplayName(_namecontroller.text.trim());
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      print("FIREBASE ERROR: ${e.code}");
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
    } catch (e) {
      print("OTHER ERROR: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: _isLogin
          ? MediaQuery.of(context).size.height * 0.52
          : MediaQuery.of(context).size.height * 0.73,
      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          // Tabs
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isLogin = false),
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
                    child: Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: AppWidget.HeadlineTextStyle(19.0).copyWith(
                        color: !_isLogin ? Color(0xFF2D5A27) : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isLogin = true),
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
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: AppWidget.HeadlineTextStyle(19.0).copyWith(
                        color: _isLogin ? Color(0xFF2D5A27) : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          // Scrollable form
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 16, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    _isLogin ? "Welcome back!" : "Create an account",
                    style: AppWidget.HeadlineTextStyle(20.0),
                  ),
                  SizedBox(height: 10),

                  // Fullname (signup only)
                  if (!_isLogin) ...[
                    Text("Fullname",
                      style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54, fontSize: 19),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _namecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your fullname",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],

                  // Email
                  Text("Email address",
                    style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54, fontSize: 19),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Email address",
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Password
                  Text("Password",
                    style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54, fontSize: 19),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Password",
                      ),
                    ),
                  ),

                  // Confirm password (signup only)
                  if (!_isLogin) ...[
                    SizedBox(height: 10),
                    Text("Confirm Password",
                      style: AppWidget.SimpleTextStyle().copyWith(color: Colors.black54, fontSize: 19),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _confirmpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Please confirm your Password",
                        ),
                      ),
                    ),
                  ],

                  // Error message
                  if (_errorMessage != null) ...[
                    SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  ],

                  SizedBox(height: 24),

                  // Button
                  Center(
                    child: SizedBox(
                      width: 320,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2D5A27),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: _isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : Text(
                              _isLogin ? "Login" : "Create Account",
                              style: AppWidget.HeadlineTextStyle(19.0).copyWith(color: Colors.white),
                            ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}