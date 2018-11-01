import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Icon icon;

  MenuItem({this.onTap,this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        this.onTap();
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.0,),
        child: Row(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(left: 20.0),
                // child: Container(
                //   decoration: new BoxDecoration(
                //     color: Colors.black45,
                //     borderRadius: BorderRadius.circular(100.0),
                //   ),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: icon
                    )),
            // ),
            new Text(title,
                style: TextStyle(color: Colors.black87, fontSize: 15.0))
          ],
        ),
      ),
    );
  }
}
