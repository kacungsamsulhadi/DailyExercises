import 'package:flutter/material.dart';

class inputBerat extends StatelessWidget {
  const inputBerat({
    Key key,
    @required this.controllerBerat,
  }) : super(key: key);

  final TextEditingController controllerBerat;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerBerat,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Masukkan Berat Badan Anda /Kg",
        labelText: "Berat Badan (Kg)",
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
