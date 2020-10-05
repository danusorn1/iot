import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot/scrven/authen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApps());
}
class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
      
    );
  }
}