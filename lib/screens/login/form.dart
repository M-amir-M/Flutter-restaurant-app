import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: new Stack(
                    children: <Widget>[
                      TextFormField(
                        controller: _mobileController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                                left: 20.0,
                                right: 50.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0)),
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
                      ),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: new Stack(
                    children: <Widget>[
                      TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                                left: 20.0,
                                right: 50.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0)),
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
                      ),
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: new ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: new FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.green,
                        child: new Text(
                          'ورود',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    )),
              ],
            ),
          
    );
  }
}
