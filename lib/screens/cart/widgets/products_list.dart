import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/widgets/product_card_2.dart';
import 'package:online_store/screens/product/product.dart';

class ViewList extends StatefulWidget {
  @override
  ViewListState createState() => new ViewListState();
}

class ViewListState extends State<ViewList> {
  @override
  void initState() {
    super.initState();
  }

  void onTap(data) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext ctx) => new ProductPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of(context).cartBloc;

    return new StreamBuilder(
      stream: cartBloc.cart,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount:
              snapshot.data.items == null ? 0 : snapshot.data.items.length,
          itemBuilder: (BuildContext context, int index) {
            return new ProductCard(
              snapshot.data.items[index],
                () => onTap(snapshot.data.items[index]));
          },
        );
      },
    );
  }
}
