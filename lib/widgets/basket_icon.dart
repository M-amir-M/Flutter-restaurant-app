import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/widgets/badge_icon.dart';

class BasketIcon extends StatefulWidget{
  
  final VoidCallback onCartPressed;
  BasketIcon(this.onCartPressed);

  @override
  BasketIconState createState() => new BasketIconState();
}

class BasketIconState extends State<BasketIcon> with TickerProviderStateMixin{
  



  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of(context).cartBloc;
    return new StreamBuilder(
      stream: cartBloc.cart,
      builder: (context, snapshot) {
        return new IconButton(
          icon: new Badge.left(
            child: new Icon(Icons.shopping_cart),
            value: snapshot.data.itemCount.toString(),
          ),
          tooltip: 'Shopping cart',
          onPressed: () => widget.onCartPressed(),
        );
      },
    );
  }

}
