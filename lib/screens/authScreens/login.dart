import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/auth/firebaseAuth.dart';
import 'package:meditation_app/screens/authScreens/register.dart';
import 'package:meditation_app/screens/authScreens/reset.dart';

import '../home_screen.dart';
import '../style_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: isLoading == false
          ? Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: 'Enter your Email',
                        hintStyle: kHintTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: kHintTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        AuthClass()
                            .signIN(
                                email: _email.text.trim(),
                                password: _password.text.trim())
                            .then((value) {
                          if (value == "Welcome") {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                          }
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        //Sign In with google
                        AuthClass()
                            .signWithGoogle()
                            .then((UserCredential value) {
                          final displayName = value.user.displayName;

                          print(displayName);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (route) => false);
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.red,
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Don't have an account? Register "),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResetPage()));
                    },
                    child: Text("Forgot Password? reset "),
                  ),
                  //Social Auth Buttons
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
