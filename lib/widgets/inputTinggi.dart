import 'package:flutter/material.dart';

class inputTinggi extends StatelessWidget {
  const inputTinggi({
    Key key,
    @required this.controllerTinggi,
  }) : super(key: key);

  final TextEditingController controllerTinggi;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerTinggi,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Masukkan Tinggi Badan Anda /M",
        labelText: "Tinggi Badan (M)",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
