import 'package:auth/home.dart';
import 'package:auth/model/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>
        Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0
          ),
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
            runAlignment: WrapAlignment.center,
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
                      controller: username,
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
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'This field is required';
                        } return null;
                      },
                    ),
                    Padding(padding: const EdgeInsets.all(26.0)),
                    TextFormField(
                      controller: password,
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              User _user = await getUser(username.text);
                              if (_user.toMap()['password'] != password.text) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Invalid username or password"),
                                ));
                              } else {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                              }
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0
                        )),
                        FlatButton(
                          child: Text(
                            'SIgnup'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Login with Touch ID',
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      ),
                      RaisedButton(
                        onPressed: () => debugPrint("sds"),
                        child: Ink(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.center,
                              colors: [Color.fromRGBO(170, 105, 99, 1), Color.fromRGBO(164, 84, 104, 1)]
                            )
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.1, 0.5],
                                    colors: [Color.fromRGBO(205, 116, 102, 0.6), Color.fromRGBO(202, 87, 105, 0.6)]
                                ),
                              ),
                              padding: EdgeInsets.all(7.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.1, 0.5],
                                      colors: [Color.fromRGBO(242, 141, 102, 1), Color.fromRGBO(241, 96, 111, 0.6)]
                                  ),
                                ),
                                child: Icon(
                                  Icons.fingerprint,
                                  color: Colors.black54,
                                  size: 50.0,
                                ),
                              )
                          ),
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}

//Hey, your face glows so bright, I feel you could rule my world everywhere you go.
//Why dont you put in your number here and be the only network in my smartphone
