import 'package:flutter/material.dart';
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showLogo() {
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      body: Container(
      alignment: Alignment(0, -1),
      padding: EdgeInsets.only(top:70.0),
      child: Column(
        children: <Widget>[Text('My Authen')],
      )
      ),
      
    );
  }
}