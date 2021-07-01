import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/home_screen.dart';
import 'package:meditation_app/widgets/calculate.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.blue,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.white,
      height: 50,
      items: [
        Icon(
          Icons.home,
          size: 20,
          color: Colors.black,
        ),
        Icon(
          Icons.calculate,
          size: 20,
          color: Colors.black,
        ),
      ],
      animationDuration: Duration(milliseconds: 200),
      animationCurve: Curves.bounceInOut,
      onTap: (index) {
        debugPrint("Current Index is $index");
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CalculateScreen();
            }),
          );
        } else {}
      },
    );
  }
}
