import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({
    Key key,
    @required String result,
    @required double hasil,
    @required String result2,
  })  : _result = result,
        _hasil = hasil,
        _result2 = result2,
        super(key: key);

  final String _result;
  final double _hasil;
  final String _result2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Hasil:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "$_result",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "$_hasil",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$_result2",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
