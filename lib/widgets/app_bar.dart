import 'package:flutter/material.dart';
class AppBarLayout{
  final appBar = new AppBar(
        elevation: 0.0,
        title: new Center(
          child: new Text(
            'منوی رستوران',
            textAlign: TextAlign.center,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          tooltip: 'Drawer',
          icon: new Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.shopping_cart),
            tooltip: 'Shopping cart',
            onPressed: () {},
          ),
        ],
      );
  
}