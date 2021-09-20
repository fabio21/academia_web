import 'package:flutter/material.dart';

BoxDecoration buildBoxDecoration({Color color =  Colors.white}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withAlpha(100),
          spreadRadius: -2,
          blurRadius: 16,
          offset: Offset(0, 4))
    ],
  );
}

BoxDecoration buildBoxDecoration2({Color color =  Colors.white}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withAlpha(100),
          spreadRadius: -2,
          blurRadius: 8,
          offset: Offset(0, 4))
    ],
  );
}

decoration({required String label}) {
  return InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    counterText: "",
    errorStyle: TextStyle(fontSize: 12),
    focusedErrorBorder: outlineInputBorder(color: Colors.red),
    focusedBorder: outlineInputBorder(color: Colors.blue),
    enabledBorder: outlineInputBorder(),
    disabledBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder({Color color = Colors.black12}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: color,
    ),
  );
}