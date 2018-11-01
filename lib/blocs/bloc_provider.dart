import 'package:flutter/material.dart';
import 'package:online_store/blocs/auth.dart';
import 'package:online_store/blocs/cart.dart';
import 'package:online_store/blocs/products.dart';

class BlocProvider extends InheritedWidget {
  final CartBloc cartBloc = CartBloc();
  final ProductsBloc productsBloc = ProductsBloc();
  final AuthBloc authBloc = AuthBloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static BlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
