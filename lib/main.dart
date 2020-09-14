import 'package:flutter/material.dart';
import 'package:iot/scrven/authen.dart';
main(){
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