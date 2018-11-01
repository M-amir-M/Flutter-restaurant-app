import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';

class ProductPage extends StatefulWidget {
  final data;
  ProductPage(this.data);

  @override
  ProductState createState() => new ProductState();
}

class ProductState extends State<ProductPage> {
  void _addToCart(data) {}

  void _removeFromCart(data) {}

  @override
  Widget build(BuildContext ctx) {
    final appBar = new AppBar(
      elevation: 0.0,
      title: new Center(
        child: new Text(
          widget.data['title'],
          textAlign: TextAlign.center,
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      leading: new Container(),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.arrow_forward),
          tooltip: 'Back',
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    );

    var _productImage =
        new Image.asset('assets/images/' + widget.data['thumbnail']);
    var heroImage = new Hero(
      tag: 'hero-tag-' + widget.data['id'].toString(),
      child: _productImage,
    );

    final cartBloc = BlocProvider.of(context).cartBloc;

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new StreamBuilder(
          stream: cartBloc.cart,
          builder: (context, snapshot) {
            return new Scaffold(
                appBar: appBar,
                body: new Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        child: new Padding(
                            padding: EdgeInsets.all(20.0),
                            child: new Center(
                              child: heroImage,
                            )),
                      ),
                      new Expanded(
                          child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            widget.data['price'].toString() + " تومان",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            widget.data['description'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w100),
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartBloc.remove.add(widget.data);
                                },
                              ),
                              new Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              new IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartBloc.addition.add(widget.data);
                                },
                              ),
                            ],
                          ),
                          new Center(
                              child: new ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: new FlatButton(
                              padding: EdgeInsets.all(10.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Colors.green,
                              child: new Text(
                                'افزودن به خرید',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                _addToCart(widget.data);
                              },
                            ),
                          )),
                          new Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          )
                        ],
                      ))
                    ],
                  ),
                ));
          },
        ));
  }
}
