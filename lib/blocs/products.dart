import 'dart:async';
import 'package:online_store/utils/cart.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  static final List _productsInstance = [
    {
      "id": 1,
      "title": "قرمه سبزی",
      "description":
          " شامل گوشت گوساله و برنج ایرانی و روغن زیتون شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
      "price": 14200,
      "rate" : 3.5,
      "thumbnail": "plate1.png"
    },
    {
      "id": 2,
      "title": "جوجه کباب",
      "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
      "price": 15000,
      "rate" : 3.2,
      "thumbnail": "plate2.png"
    },
    {
      "id": 3,
      "title": "فسنجان",
      "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
      "price": 14000,
      "rate" : 4.0,
      "thumbnail": "plate3.png"
    },
    {
      "id": 4,
      "title": " پیتزا",
      "description": "شامل پنیر و قارچ و گوجه و گوشت و سس",
      "price": 14500,
      "rate" : 2.0,
      "thumbnail": "plate4.png"
    },
    {
      "id": 5,
      "title": "کباب برگ",
      "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
      "price": 11000,
      "rate" : 4.2,
      "thumbnail": "plate5.png"
    },
    {
      "id": 6,
      "title": "چلو گوشت",
      "description": "شامل گوشت گوساله و برنج ایرانی و روغن زیتون",
      "price": 12000,
      "rate" : 3.0,
      "thumbnail": "plate6.png"
    }
  ];

  final _products = new BehaviorSubject<List>(seedValue: _productsInstance);

  Stream<List> get products => _products.stream;

  ProductsBloc() {
    // _additionController.stream.listen(onAdd);
  }
}
