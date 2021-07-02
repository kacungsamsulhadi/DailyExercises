import 'package:flutter/material.dart';
import 'package:meditation_app/auth/firebaseAuth.dart';
import 'package:meditation_app/screens/authScreens/login.dart';

class buttonLogout extends StatefulWidget {
  const buttonLogout({
    Key key,
  }) : super(key: key);

  @override
  State<buttonLogout> createState() => _buttonLogoutState();
}

class _buttonLogoutState extends State<buttonLogout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            var isLoading = true;
          });
          AuthClass().signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }),
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue.shade400,
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
