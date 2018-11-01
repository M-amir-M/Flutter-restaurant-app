class Cart {
  static List _items;

  List get items => _items;

  int get itemCount => _items.length;

  int get totalPrice {
    int sum = 0;
    _items.forEach((item) {
      sum += item['price'] * item['quantity'];
    });
    return sum;
  }

  Cart() {
    _items = [];
  }

  void addToCart(product) {
    bool exist = false;
    for (var i = 0; i < _items.length; i++) {
      if (product['id'] == _items[i]['id']) {
        exist = true;
        _items[i]['quantity']++;
        break;
      }
    }
    if (!exist) {
      product['quantity'] = 1;
      _items.add(product);
    }
  }

  void removeFromCart(product) {
    for (var i = 0; i < _items.length; i++) {
      if (product['id'] == _items[i]['id']) {
        if (_items[i]['quantity'] > 1) {
          _items[i]['quantity']--;
        } else {
          _items.removeAt(i);
        }
      }
    }
  }

  void deleteFromCart(product) {
    for (var i = 0; i < _items.length; i++) {
      if (product['id'] == _items[i]['id']) {
        _items.removeAt(i);
      }
    }
  }
}
