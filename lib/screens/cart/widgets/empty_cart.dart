import 'package:flutter/material.dart';

class EmptyCart extends StatefulWidget {
  @override
  EmptyCartState createState() => new EmptyCartState();
}

class EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset('assets/images/empty-cart.gif'),
          new Text('لیست سفارشات خالیه!!',
              style: TextStyle(fontSize: 25.0, color: Colors.grey)),
        ],
      ),
    );
  }
}
