import 'package:flutter/material.dart';
import 'package:online_store/blocs/cart.dart';
import 'package:online_store/widgets/rate_star.dart';
import 'package:online_store/utils/jalali.dart';
import 'package:online_store/blocs/bloc_provider.dart';


class ProductCard extends StatefulWidget{
  final data;
  final VoidCallback onTap;
  ProductCard(this.data, this.onTap);

  @override
  ProductCardState createState() => new ProductCardState();
}

class ProductCardState extends State<ProductCard> {

  void _onPressed(data) {
    PersianDate date = new PersianDate.now();
    print(date.toString());
  }

  @override
  Widget build(BuildContext ctx) {
    var data = widget.data;
    var _productImage = new Image.asset('assets/images/' + data['thumbnail']);
    var heroImage = new Hero(
      tag: 'hero-tag-' + data['id'].toString(),
      child: _productImage,
    );

    // همیشه اینجوری باید بلاک رو استفاده کنی
    // هیچوقت اینستنش جدید ایجاد نکن
    // من چحوری استفاده کرده بودم؟؟
    CartBloc cartBloc = BlocProvider.of(context).cartBloc;

    // اینجوری بود قبلش   
    // Wrong: cartBloc = new CartBloc()

    return new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        Container(
          child: new Card(
            elevation: 3.0,
            child: new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(),
                    ),
                    new Expanded(
                        child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          data['title'],
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        new Text(data['description']),
                        new StarRating(
                          rating: data['rate'],
                          onRatingChanged: (double rate) {
                            print(rate);
                          },
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(
                                  data['price'].toString() + " تومان",
                                ),
                                new IconButton(
                                  icon: new Icon(Icons.add_circle),
                                  iconSize: 25.0,
                                  onPressed: () {
                                    cartBloc.addition.add(data);
                                  },
                                )
                              ],
                            ))
                      ],
                    ))
                  ],
                )),
          ),
        ),
        new Container(
            child: new Row(
          children: <Widget>[
            new Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: new EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 10.0, bottom: 30.0),
                    child: new InkWell(
                      onTap: widget.onTap,
                      child: heroImage,
                    ),
                  ),
                ],
              ),
            ),
            new Expanded(
              child: new Container(),
            )
          ],
        )),
      ],
    );
  }
}
