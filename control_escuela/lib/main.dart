import 'package:control_escuela/paginas/LoginUser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(inicioApp());
}

class inicioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
