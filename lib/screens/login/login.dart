import 'dart:async';

import 'package:flutter/material.dart';

import 'package:online_store/blocs/bloc_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _mobileController = TextEditingController();
  final _passController = TextEditingController();
  Timer _timer;

  Map _data = {
    'mobile': '',
    'password': '',
  };

  @override
  void dispose() {
    _mobileController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = new AppBar(
      backgroundColor: Colors.green,
      elevation: 1.0,
      title: new Center(
        child: new Text(
          'ورود',
          textAlign: TextAlign.center,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      leading: new Container(),
      actions: <Widget>[
        IconButton(
          icon: new Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    final authBloc = BlocProvider.of(context).authBloc;

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new StreamBuilder(
            stream: authBloc.auth,
            builder: (context, snapshot) {
              void _login() {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  _scafoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(
                    'در حال بررسی...',
                    style: TextStyle(fontFamily: 'is', fontSize: 17.0),
                  )));

                  authBloc.login.add(this._data);
                  if (snapshot.data['isAuth'] == true) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                }
              }

              return new Scaffold(
                  key: _scafoldKey,
                  appBar: appBar,
                  body: new Center(
                      child: new Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                width: 150.0,
                                height: 150.0,
                                child: Center(
                                  child: Image.asset('assets/images/logo.png'),
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: new Stack(
                                      children: <Widget>[
                                        TextFormField(
                                            controller: _mobileController,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 15.0,
                                                        bottom: 15.0,
                                                        left: 20.0,
                                                        right: 50.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0)),
                                                hintText: 'شماره همراه'),
                                            style: TextStyle(
                                                fontFamily: 'is',
                                                fontSize: 18.0,
                                                color: Colors.black87),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'شماره همراه وارد نشده!';
                                              }
                                            },
                                            onSaved: (String value) {
                                              this._data['mobile'] = value;
                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              FontAwesomeIcons.userCircle,
                                              size: 28.0,
                                              color: Colors.green,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.0),
                                    child: new Stack(
                                      children: <Widget>[
                                        TextFormField(
                                            obscureText: true,
                                            controller: _passController,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 15.0,
                                                        bottom: 15.0,
                                                        left: 20.0,
                                                        right: 50.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0)),
                                                hintText: 'رمز عبور'),
                                            style: TextStyle(
                                                fontFamily: 'is',
                                                fontSize: 18.0,
                                                color: Colors.black87),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'رمز عبور وارد نشده!';
                                              }
                                            },
                                            onSaved: (String value) {
                                              this._data['password'] = value;
                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              FontAwesomeIcons.key,
                                              size: 25.0,
                                              color: Colors.green,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: new ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity),
                                        child: new FlatButton(
                                          padding: EdgeInsets.all(10.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0)),
                                          color: Colors.green,
                                          child: new Text(
                                            'ورود',
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _login();
                                          },
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ]),
                  )));
            }));
  }

  void onLoginPressed() {
    // Navigator.pushNamed(context, '/cart');
  }
}

class _LoginData {
  String mobile = '';
  String password = '';
}
