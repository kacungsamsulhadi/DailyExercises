import 'package:flutter/material.dart';
import 'package:meditation_app/auth/firebaseAuth.dart';
import 'package:meditation_app/screens/authScreens/login.dart';

import '../widgets/results.dart';

class CalculateScreen extends StatefulWidget {
  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  var controllerBerat = new TextEditingController();
  var controllerTinggi = new TextEditingController();
  bool isLoading = false;

  double _berat = 0;
  double _tinggi = 0;
  double _hasil = 0;
  String _result = '';
  String _result2 = '';

  _hitung() {
    setState(() {
      _berat = double.parse(controllerBerat.text);
      _tinggi = double.parse(controllerTinggi.text);

      _hasil = _berat / (_tinggi * _tinggi);
      if (_hasil > 0 && _hasil < 18.5) {
        _result = 'Kurus';
        _result2 =
            'Terapkan diet recomendation yang ada di aplikasi ini agar berat badan anda ideal :)';
      }
      if (_hasil >= 18.5 && _hasil < 22.9) {
        _result = "Normal";
        _result2 = 'Bagus, Berat badan anda normal';
      }
      if (_hasil >= 23 && _hasil < 27.5) {
        _result = ("Overweight");
        _result2 =
            'Terapkan latihan yang ada di aplikasi ini agar berat badan anda ideal :)';
      }
      if (_hasil > 27.5) {
        _result = "Obesitas";
        _result2 =
            'Terapkan latihan yang ada di aplikasi ini agar berat badan anda ideal :)';
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Berat Badan Ideal",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        TextFormField(
                          controller: controllerBerat,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            hintText: "Masukkan Berat Badan Anda /Kg",
                            labelText: "Berat Badan (Kg)",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        TextFormField(
                          controller: controllerTinggi,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            hintText: "Masukkan Tinggi Badan Anda /M",
                            labelText: "Tinggi Badan (M)",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () {
                              setState(() {
                                _hitung();
                              });
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.brown.shade100,
                            child: Text(
                              'Hitung',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                        result(
                            result: _result, hasil: _hasil, result2: _result2),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () {
                              setState(() {
                                isLoading = true;
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
