import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/widgets/product_card_1.dart';
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
    
    final productsBloc = BlocProvider.of(context).productsBloc;

    return new StreamBuilder(
      stream: productsBloc.products,
      builder: (context, sh) {
        return new ListView.builder(
          itemCount: sh.data == null ? 0 : sh.data.length,
          itemBuilder: (BuildContext context, int index) {
            return new ProductCard(
                sh.data[index], () => onTap(sh.data[index]));
          },
        );
      },
    );
  }
}
