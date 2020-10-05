

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot/scrven/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double amount = 150.0;
  double size = 250.0;
  String emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool checkSpace(String value) {
    //check space input from email and password
    bool result = false;
    if (value.length == 0) {
      // have space
      result = true;
    }
    return result;
  }

  Widget showLogo() {
    return Container(
      width: amount,
      height: amount,
      child: Image.asset(
        'images/iconfinder.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showName() {
    return Container(
      child: Text(
        'MushRoom Farm IoT',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.orange[500],
            fontWeight: FontWeight.bold,
            fontFamily: 'GloriaHallelujah'),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true, //secure password
        style: TextStyle(
          color: Colors.orange[200],
        ),
        keyboardType: TextInputType.text, //keyboard style
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              size: 50.0,
              color: Colors.orange[200],
            ),
            labelText: 'Password : ',
            labelStyle: TextStyle(
              color: Colors.orange[200],
            ),
            hintText: 'More 6 Charactor'),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Password Empty';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }
  void moveToMyServive(BuildContext context){
    var myServiceRoute =
    MaterialPageRoute(builder:(BuildContext context) => MyService());
    Navigator.of(context).pushAndRemoveUntil(myServiceRoute, (Route<dynamic>route) => false);

  }
  void checkAuthen(BuildContext context) async {
    await firebaseAuth
       .signInWithEmailAndPassword(email: emailString, password: passwordString).then((objValue){
         moveToMyServive(context);
       }).catchError((objValue){
         String error = objValue.message;
         print('ERROR => $error');
       });
    
  }
  

  

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(
          color: Colors.orange[200],
        ),
        keyboardType: TextInputType.emailAddress, //keyboard style
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              size: 50.0,
              color: Colors.orange[200],
            ),
            labelText: 'User : ',
            labelStyle: TextStyle(
              color: Colors.orange[200],
            ),
            hintText: 'you@email.com'), // InputDecoration
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Please Type in Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return Expanded(
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.orange[500]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.orange[500]),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signInButton(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orange[500],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (formkey.currentState.validate()){
            formkey.currentState.save();
            checkAuthen(context);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment(0, -1),
        padding: EdgeInsets.only(top: 70.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              // Text('My Authen')
              showLogo(),
              showName(),
              emailText(),
              passwordText(),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                width: size,
                child: Row(
                  children: <Widget>[
                    signInButton(context),
                    signUpButton(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
