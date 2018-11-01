import 'package:flutter/material.dart';
import 'package:online_store/screens/home/widgets/products_list.dart';
import 'package:online_store/widgets/basket_icon.dart';
import 'package:online_store/widgets/drawer/drawer.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void onCartPressed(BuildContext context) {
    // Navigator.pushNamed(context, '/cart');
    // Navigator.push(context,
    //     new MaterialPageRoute(builder: (BuildContext ctx) => new Cart()));
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext ctx) {
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
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      actions: <Widget>[new BasketIcon(() => onCartPressed(ctx))],
    );

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          key: _scaffoldKey,
          appBar: appBar,
          drawer: new DrawerLayout(),
          body: new Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ViewList(),
          ),
        ));
  }
}

