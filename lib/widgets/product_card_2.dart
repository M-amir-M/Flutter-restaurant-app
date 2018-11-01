import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:flutter/animation.dart';

class ProductCard extends StatefulWidget {
  final data;
  final VoidCallback onTap;
  ProductCard(this.data, this.onTap);

  @override
  ProductCardState createState() => new ProductCardState();
}

class ProductCardState extends State<ProductCard>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   controller.reverse();
      // } else if (status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProductCard oldWidget){

    super.didUpdateWidget(oldWidget);
    if(oldWidget.data != widget.data){
      // controller.reverse();
    }
  }

  @override
  Widget build(BuildContext ctx) {
    var data = widget.data;
    var _productImage = new Image.asset('assets/images/' + data['thumbnail']);
    var heroImage = new Hero(
      tag: 'hero-tag-' + data['id'].toString(),
      child: _productImage,
    );

    final cartBloc = BlocProvider.of(context).cartBloc;

    return new Dismissible(
      key: new ObjectKey(data),
      direction: DismissDirection.horizontal,
      onDismissed: (DismissDirection direction){
        cartBloc.delete.add(data);
        // controller.reverse();
      },
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: Container(
          child: new Card(
            elevation: 3.0,
            child: new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 3,
                      child: new InkWell(
                        onTap: widget.onTap,
                        child: heroImage,
                      ),
                    ),
                    new Expanded(
                        flex: 4,
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
                            new Text(
                              data['price'].toString() + " تومان",
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16.0),
                            ),
                          ],
                        )),
                    new Expanded(
                      child: new Column(
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              cartBloc.addition.add(data);
                            },
                          ),
                          new Text(data['quantity'].toString(),
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                          new IconButton(
                            icon: new Icon(
                              Icons.remove,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              cartBloc.remove.add(data);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
