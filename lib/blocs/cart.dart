import 'dart:async';
import 'package:online_store/utils/cart.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  static final Cart _cartInstance = new Cart();

  final _additionController = StreamController<Map>();

  Sink<Map> get addition => _additionController.sink;

  final _removeController = StreamController<Map>();

  Sink<Map> get remove => _removeController.sink;

  final _deleteController = StreamController<Map>();

  Sink<Map> get delete => _deleteController.sink;

  // final _itemCount = new BehaviorSubject<int>(seedValue: 0);

  // Stream<int> get itemCount => _itemCount.stream;

  final _cart = new BehaviorSubject<Cart>(seedValue: _cartInstance);

  Observable<Cart> get cart => _cart.stream;

  CartBloc() {
    _additionController.stream.listen(onAdd);
    _removeController.stream.listen(onRemove);
    _deleteController.stream.listen(onDelete);
  }

  void onAdd(Map product) {
    _cartInstance.addToCart(product);
    _cart.add(_cartInstance);
  }

  void onRemove(Map product) {
    print('remove');
    _cartInstance.removeFromCart(product);
    _cart.add(_cartInstance);
  }

  void onDelete(Map product) {
    print('delete');
    _cartInstance.deleteFromCart(product);
    _cart.add(_cartInstance);
  }
}
