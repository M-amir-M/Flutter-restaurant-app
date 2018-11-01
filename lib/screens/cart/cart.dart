import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/screens/cart/widgets/empty_cart.dart';
import 'package:online_store/screens/cart/widgets/products_list.dart';
import 'package:online_store/widgets/basket_icon.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = new AppBar(
      elevation: 0.0,
      title: new Center(
        child: new Text(
          'سفارشات شما',
          textAlign: TextAlign.center,
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      leading: IconButton(
        icon: new Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        new BasketIcon(() => this.onCartPressed()),
      ],
    );

    final cartBloc = BlocProvider.of(context).cartBloc;

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new StreamBuilder(
            stream: cartBloc.cart,
            builder: (context, snapshot) {
              Widget products = Column(
                children: <Widget>[
                  new Expanded(
                    flex: 4,
                    child: new Container(
                      child: ViewList(),
                    ),
                  ),
                  new Expanded(
                      child: new Column(
                    children: <Widget>[
                      new Expanded(
                        child: new Center(
                            child: new RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'is',
                                  fontSize: 20.0),
                              children: <TextSpan>[
                                new TextSpan(text: 'جمع کل :'),
                                new TextSpan(
                                    text: snapshot.data.totalPrice.toString() +
                                        ' تومان',
                                    style: TextStyle(color: Colors.green)),
                              ]),
                        )),
                      ),
                      new Expanded(
                          flex: 2,
                          child: new Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: new Center(
                                child: new ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: new FlatButton(
                                padding: EdgeInsets.all(10.0),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.green,
                                child: new Text(
                                  'بررسی سفارشات',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            )),
                          ))
                    ],
                  ))
                ],
              );

              return new Scaffold(
                  appBar: appBar,
                  body: new Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: snapshot.data.itemCount == 0 ? EmptyCart() : products));
            }));
  }

  void onCartPressed() {
    // Navigator.pushNamed(context, '/cart');
  }
}
