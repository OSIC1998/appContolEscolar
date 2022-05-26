import 'package:control_escuela/paginas/LoginUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  /*options: const FirebaseOptions(
    apiKey: "",
    appId: "1:203617750689:android:4fdfe67e7e76b20082aae0",
    messagingSenderId: "",
    projectId: "com.example.control_escuela",
  ),*/
);
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
