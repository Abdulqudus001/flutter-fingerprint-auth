import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (context) =>
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0
                  ),
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Color.fromRGBO(203, 98, 133, 1), Color.fromRGBO(84, 60, 94, 1)]
                    ),
                  ),
                  child: new Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        width: 200,
                        height: 200,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white54,
                                  ),
                                  labelText: 'Username',
                                  hintText: 'johndoe123',
                                  labelStyle: TextStyle(
                                      color: Colors.white54
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'This field is required';
                                  } return null;
                                },
                              ),
                              Padding(padding: const EdgeInsets.all(26.0)),
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white54,
                                  ),
                                  labelText: 'Email',
                                  hintText: 'johndoe123@mymail.com',
                                  labelStyle: TextStyle(
                                      color: Colors.white54
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'This field is required';
                                  } return null;
                                },
                              ),
                              Padding(padding: const EdgeInsets.all(26.0)),
                              TextFormField(
                                obscureText: _hidePassword,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.white
                                  ),
                                  hintText: '********',
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white54),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white54,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: _hidePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                                    color: Colors.white54,
                                    onPressed: () {
                                      setState(() {
                                        _hidePassword = !_hidePassword;
                                      });
                                    },
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white
                                      )
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.length < 8) {
                                    return 'Password must contain atleast 8 characters';
                                  } else if (value.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                              Padding(padding: const EdgeInsets.all(26.0)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text(
                                      'Submit'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15.0
                                      ),
                                    ),
                                    elevation: 20.0,
                                    padding: EdgeInsets.only(
                                        top: 17.0,
                                        bottom: 17.0,
                                        left: 50.0,
                                        right: 50.0
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text('Thank you for logging in. You can kindly go back'),)
                                        );
                                      }
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0
                                  )),
                                  FlatButton(
                                    child: Text(
                                      'Signin'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 120.0
                        ),
                      )
                    ],
                  ),
                ),
              )
      ),
    );
  }
}

