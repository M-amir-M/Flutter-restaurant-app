import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_store/screens/home/home.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  void handleTimeout() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => new Home()));
  }

  AnimationController _iconAnimationController;
  Animation _iconAnimation;

  startTimeout() async {
    var duration = const Duration(seconds: 7);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scaffold(
        body: new Container(
          color: Colors.white,
          child: Center(
            child: new Image(
          image: new AssetImage("assets/images/loading2.gif"),
        ))
        ),
      ),
    );
  }
} 
